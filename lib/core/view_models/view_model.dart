import 'package:dio/dio.dart';
import 'package:flutter_template/helpers/constants.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/api/base_http.dart';

import 'view_state.dart';

/// 单视图模型的状态维护类
///
/// 状态：空闲、繁忙、空数据、错误、未授权
class ViewModel with ChangeNotifier {
  // 视图状态
  ViewState _viewState;

  // 视图错误
  ViewStateError _viewStateError;

  // 错误信息
  String _errorMessage;

  /// 防止页面销毁后异步任务才完成导致的出错
  bool _disposed = false;

  ViewModel({ViewState viewState}) {
    _viewState ??= ViewState.idle;
  }

  /// 视图状态
  ViewState get viewState => _viewState;
  set viewState(ViewState viewState) {
    _viewStateError = null;
    _viewState = viewState;
    notifyListeners();
  }

  /// 视图错误
  ViewStateError get viewStateError => _viewStateError;

  /// 错误信息
  String get errorMessage => _viewStateError?.message;

  /// 是否空闲
  bool get isIdle => _viewState == ViewState.idle;

  /// 是否繁忙
  bool get isBusy => _viewState == ViewState.busy;

  /// 是否空数据
  bool get isEmpty => _viewState == ViewState.empty;

  /// 是否出错
  bool get isError => _viewState == ViewState.error;

  /// 是否未授权
  bool get isUnAuthorized => _viewState == ViewState.unAuthorized;

  /// 设置为空闲状态
  void setIdle() {
    viewState = ViewState.idle;
  }

  /// 设置为繁忙状态
  void setBusy() {
    viewState = ViewState.busy;
  }

  /// 设置为空数据状态
  void setEmpty() {
    viewState = ViewState.empty;
  }

  /// 设置为错误状态
  void setError(e, s, {String message}) {
    ErrorType errorType = ErrorType.defaultError;

    // Dio 错误处理
    if (e is DioError) {
      e = e.error;
      if (e is UnAuthorizedException) {
        // 未授权异常
        s = null;
        setUnAuthorized(); // 由 onUnAuthorizedException 负责处理
        return;
      } else if (e is NotSuccessException) {
        // 不成功异常
        s = null;
        message = e.message;
      } else {
        // 网络异常
        errorType = ErrorType.networkError;
      }
    }

    viewState = ViewState.error;
    _viewStateError = ViewStateError(
      errorType,
      message: message,
      errorMessage: e.toString(),
    );
    printErrorStack(e, s);
  }

  /// 设置为未授权状态
  void setUnAuthorized() {
    viewState = ViewState.unAuthorized;
    onUnAuthorizedException();
  }

  /// 未授权的回调
  void onUnAuthorizedException() {}

  /// 显示错误信息
  showErrorMessage(
    context, {
    String networkErrorMessage,
    bool showWidget = true,
    bool showTip = false,
  }) {
    var message = viewStateError.message;
    if (viewStateError.isNetworkError) {
      message = networkErrorMessage ?? Constants.viewStateMessageNetworkError;
    }
    if (showTip == true) {
      Future.microtask(() {
        showToast(message, context: context);
      });
    }
    return showWidget ? Text(message) : Container();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      // 确保页面未销毁时再通知
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  String toString() {
    return 'ViewModel(viewState: $_viewState, errorMessage: $_errorMessage)';
  }

  /// 错误和异常处理器，统一处理子类的异常情况
  ///
  /// [e] 可能是 String、Error 或 Exception
  ///
  /// [s] 堆栈信息
  void printErrorStack(e, s) {
    debugPrint('''
══╡ ERROR ↓↓↓↓↓↓↓↓↓↓ ╞═══════════════════════════════════════════════════════════
$e
══╡ ERROR ↑↑↑↑↑↑↑↑↑↑ ╞═══════════════════════════════════════════════════════════  
      ''');

    if (s != null) debugPrint('''
══╡ TRACE ↓↓↓↓↓↓↓↓↓↓ ╞═══════════════════════════════════════════════════════════
$s
══╡ TRACE ↑↑↑↑↑↑↑↑↑↑ ╞═══════════════════════════════════════════════════════════
    ''');
  }
}
