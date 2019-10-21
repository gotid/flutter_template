import 'package:flutter/foundation.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_template/core/api/base_http.dart';
import 'package:flutter_template/helpers/storage_manager.dart';

final http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://www.wanandroid.com/';
    interceptors
      ..add(ApiInterceptor())
      ..add(CookieManager(
          PersistCookieJar(dir: StorageManager.temporaryDirectory.path)));
  }
}

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    debugPrint('---wan-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
    return options;
  }

  @override
  onResponse(Response response) async {
    ResponseData responseData = ResponseData.fromJson(response.data);
    if (responseData.success) {
      response.data = responseData.data;
      return http.resolve(response);
    } else {
      return handleFailed(responseData);
    }
  }

  Future<Response> handleFailed(ResponseData responseData) {
    debugPrint('---wan-response--->error---->$responseData');
    if (responseData.code == -1001) {
      // 需要登录
      throw UnAuthorizedException();
    }
    return http.reject(responseData.message);
  }
}

class ResponseData extends BaseResponseData {
  @override
  bool get success => code == 0;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['errorCode'];
    message = json['errorMsg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      'errorCode': code,
      'errorMsg': message,
      'data': data,
    };
  }
}
