import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// 骨架条修饰器，用于自定义骨架条的修饰
class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({
    isCircle: false,
    isDark: false,
  }) : super(
          color: !isDark ? Colors.grey[350] : Colors.grey[700],
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
}

/// 底部边线修饰器(默认 0.3 逻辑像素宽)
class BottomBorderDecoration extends BoxDecoration {
  BottomBorderDecoration({width: 0.3})
      : super(border: Border(bottom: BorderSide(width: width)));
}

/// 骨架条
class SkeletonItem extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  const SkeletonItem(
      {@required this.width, @required this.height, this.isCircle: false});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.light;
    // Divider.createBorderSide(context, width: 0.7);
    return Container(
        width: width,
        height: height,
        decoration: SkeletonDecoration(isCircle: isCircle, isDark: isDark));
  }
}

/// 骨架列表
class SkeletonList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final IndexedWidgetBuilder builder;

  const SkeletonList(
      {this.padding: const EdgeInsets.all(7),
      this.length: 6,
      @required this.builder});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        child: Padding(
          padding: padding,
          child: Column(
            children: List.generate(length, (index) => builder(context, index)),
          ),
        ),
        baseColor: isDark ? Colors.grey[700] : Colors.grey[300],
        highlightColor: isDark ? Colors.grey[500] : Colors.grey[200],
        period: Duration(milliseconds: 1200),
      ),
    );
  }
}
