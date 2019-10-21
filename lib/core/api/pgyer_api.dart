import 'package:flutter/foundation.dart';

import 'base_http.dart';

final http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://www.pgyer.com/apiv2/';
    interceptors.add(PgyerApiInterceptor());
  }
}

class PgyerApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.queryParameters['_api_key'] = '00f25cece8e201753872c268b5832df9';
    options.queryParameters['appKey'] = '7954deb7bce815d3b49a0626ff0b76a7';
    debugPrint('---pgyer-request--->url--> ${options.baseUrl}${options.path}' +
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
      throw NotSuccessException.fromResponseData(responseData);
    }
  }
}

class ResponseData extends BaseResponseData {
  @override
  bool get success => code == 0;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
