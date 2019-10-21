part of 'view_model_helper.dart';

/// 视图状态 —— 加载中组件
class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

/// 视图状态组件
class ViewStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  const ViewStateWidget(
      {Key key,
      this.title,
      this.message,
      this.image,
      this.buttonText,
      this.buttonTextData,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle =
        Theme.of(context).textTheme.subhead.copyWith(color: Colors.grey);
    var messageStyle = titleStyle.copyWith(
        color: titleStyle.color.withOpacity(0.7), fontSize: 14);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        image ?? Icon(IconFonts.pageError, size: 80, color: Colors.grey[500]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title ?? Constants.viewStateMessageError),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200, minHeight: 150),
                child: SingleChildScrollView(
                  child: Text(message ?? '', style: messageStyle),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: ViewStateButton(
            child: buttonText,
            textData: buttonTextData,
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}

/// 页面无数据
class ViewStateEmptyWidget extends StatelessWidget {
  final String message;
  final Widget image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateEmptyWidget(
      {Key key,
      this.image,
      this.message,
      this.buttonText,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: onPressed,
      image: image ?? Icon(IconFonts.pageEmpty, size: 100, color: Colors.grey),
      title: message ?? Constants.viewStateMessageEmpty,
      buttonText: buttonText,
      buttonTextData: Constants.viewStateButtonRefresh,
    );
  }
}

/// 视图状态——出错部件
class ViewStateErrorWidget extends StatelessWidget {
  final ViewStateError error;
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  const ViewStateErrorWidget(
      {Key key,
      @required this.error,
      this.title,
      this.message,
      this.image,
      this.buttonText,
      this.buttonTextData,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultImage;
    var defaultTitle;
    var errorMessage;

    switch (error.errorType) {
      case ErrorType.networkError:
        defaultImage =
            Icon(IconFonts.pageNetworkError, size: 100, color: Colors.grey);
        defaultTitle = Constants.viewStateMessageNetworkError;
        errorMessage = ''; // 网络异常时移除消息提示
        break;
      case ErrorType.defaultError:
        defaultImage = Icon(IconFonts.pageError, size: 100, color: Colors.grey);
        defaultTitle = Constants.viewStateMessageError;
        break;
    }

    return ViewStateWidget(
      onPressed: onPressed,
      image: image ?? defaultImage,
      title: title ?? defaultTitle,
      message: message ?? errorMessage,
      buttonText: buttonText,
      buttonTextData: buttonTextData,
    );
  }
}

/// 页面未授权
class ViewStateUnAuthWidget extends StatelessWidget {
  final String message;
  final Widget image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateUnAuthWidget(
      {Key key,
      this.image,
      this.message,
      this.buttonText,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ?? ViewStateUnAuthImage(),
      title: message ?? Constants.viewStateMessageUnAuth,
      buttonText: buttonText,
      buttonTextData: Constants.viewStateButtonLogin,
    );
  }
}

/// 未授权图片
class ViewStateUnAuthImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'loginLogo',
      child: Image.asset(
        ImageHelper.asset('login_logo.png'),
        width: 130,
        height: 100,
        fit: BoxFit.fitWidth,
        color: Theme.of(context).accentColor,
        colorBlendMode: BlendMode.srcIn,
      ),
    );
  }
}

/// 视图状态公用按钮
class ViewStateButton extends StatelessWidget {
  final Widget child;
  final String textData;
  final VoidCallback onPressed;

  const ViewStateButton({Key key, this.textData, this.onPressed, this.child})
      : assert(child == null || textData == null);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPressed,
      child: child ??
          Text(
            textData ?? Constants.viewStateButtonRetry,
            style: TextStyle(wordSpacing: 5),
          ),
      textColor: Colors.grey,
      splashColor: Theme.of(context).splashColor,
      highlightedBorderColor: Theme.of(context).splashColor,
    );
  }
}
