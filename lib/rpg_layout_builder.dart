import 'package:flutter/material.dart';
import 'package:flutter_template/style.dart';

/// 布局类型
enum RpgLayout { slim, wide, ultraWide }

/// 构建指定布局部件的函数签名
///
/// 用于 RpgLayoutBuilder.builder
typedef RpgLayoutWidgetBuilder = Widget Function(
    BuildContext context, RpgLayout layout);

class RpgLayoutBuilder extends StatelessWidget {
  final RpgLayoutWidgetBuilder builder;

  const RpgLayoutBuilder({@required this.builder, Key key})
      : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: _build,
    );
  }

  /// 根据屏幕宽度确定布局并进行构建
  Widget _build(BuildContext context, BoxConstraints constraints) {
    var mediaWidth = MediaQuery.of(context).size.width;
    final RpgLayout layout = mediaWidth >= ultraWideLayoutThreshold
        ? RpgLayout.ultraWide
        : mediaWidth > wideLayoutThreshold ? RpgLayout.wide : RpgLayout.slim;
    return builder(context, layout);
  }
}
