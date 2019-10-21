import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

export 'package:dio/dio.dart';

// 必须是顶层函数
_parseAndDecode(String text) {
  return jsonDecode(text);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

/// 适配 Dio 并增加自定义操作
/// 1. 增加 JSON 解码函数
/// 2. 增加通用头信息：平台及App版本号
/// 3. 设置连接及接收超时时间为 45 秒
abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    // 自定义 JSON 解码回调函数
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    // 增加自定义头信息拦截器
    interceptors..add(HeaderInterceptor());

    init();
  }

  /// 自定义初始化方法
  void init();
}

/// Header 拦截器
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    // 默认连接和接收超时时间为 45 秒
    options.connectTimeout = 45 * 1000;
    options.receiveTimeout = 45 * 1000;

    // 追加统一 Header 头信息
    // var appVersion = await PlatformUtil.getAppVersion();
    // var version = Map()..addAll({'appVersion': appVersion});
    // options.headers['version'] = version;
    // options.headers['platform'] = Platform.operatingSystem;

    return options;
  }
}

/// 响应数据基类
abstract class BaseResponseData {
  int code = 0;
  String message;
  dynamic data;

  @mustCallSuper
  bool get success;

  BaseResponseData({this.code, this.message, this.data});

  @override
  String toString() {
    return 'BaseResponseData({code: $code, message: $message, data: $data})';
  }
}

/// 接口响应未成功异常类
class NotSuccessException implements Exception {
  String message;

  NotSuccessException.fromResponseData(BaseResponseData responseData) {
    message = responseData.message;
  }

  @override
  String toString() {
    return 'NotSuccessException(message: $message)';
  }
}

/// 未授权异常类，如未登录或权限不足
class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}
