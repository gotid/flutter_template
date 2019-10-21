import 'package:flutter/foundation.dart';
import 'base_http.dart';

// 基于 SOSCoon 的 Http Api 实例
final Http http = Http();

/// 基于 SOSCoon 的 Http Api 封装类
class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://www.soscoon.com/';
    interceptors.add(ApiInterceptor());
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    options.headers["csrfToken"] = 'csrfToken';

    debugPrint(
        '══╡ TYPICODE REQUEST URL ╞══---> ${options.baseUrl}${options.path}' +
            ' queryParameters: ${options.queryParameters}');

    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    debugPrint('══╡ TYPICODE ERROR ╞══---> $err');
    return super.onError(err);
  }
}
