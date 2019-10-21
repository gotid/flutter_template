/// 视图状态
///
/// idle: 空闲
///
/// busy: 忙碌
///
/// empty: 空数据
///
/// error: 错误
///
/// unAuthorized: 未授权
enum ViewState {
  idle,
  busy,
  empty,
  error,
  unAuthorized,
}

/// 错误类型
enum ErrorType {
  defaultError,
  networkError,
}

class ViewStateError {
  ErrorType errorType;
  String message;
  String errorMessage;

  ViewStateError(this.errorType, {this.message, this.errorMessage}) {
    errorType ??= ErrorType.defaultError;
    message ??= errorMessage;
  }

  get isNetworkError => errorType == ErrorType.networkError;

  @override
  String toString() {
    return 'ViewStateError{errorType: $errorType, message: $message, errorMessage: $errorMessage}';
  }
}
