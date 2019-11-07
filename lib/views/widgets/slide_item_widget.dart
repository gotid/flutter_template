import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final List<Widget> children = [];
  final Widget child;
  final double width;

  SlideItem({
    @required this.child, this.width,
  }) {
    children
      ..add(GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print('点击啦');
        },
        child: SizedBox(
          width: width,
          child: child,
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (e) {},
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        child: Row(children: children),
      ),
    );
  }
}
