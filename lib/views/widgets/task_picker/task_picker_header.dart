import 'package:flutter/material.dart';
import 'package:flutter_template/style.dart';

/// 这是一个简单的用于任务列表的文本头。
class TaskPickerHeader extends SliverPersistentHeaderDelegate {
  final String title;
  final bool showLine;

  TaskPickerHeader(this.title, {this.showLine = true});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        showLine
            ? Positioned.fromRect(
                rect: Rect.fromLTWH(26, 25, 2, 35 - shrinkOffset),
                child: SizedOverflowBox(
                  size: Size.fromHeight(0),
                  child: Container(
                    color: treeLineColor,
                  ),
                ),
              )
            : Container(),
        Row(
          children: <Widget>[
            SizedBox(width: 15),
            // 蓝色圆形箭头
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Color.fromRGBO(84, 114, 239, 1),
                borderRadius: BorderRadius.circular(12.5),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(84, 114, 244, 0.25),
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
              ),
              child: Icon(Icons.keyboard_arrow_down),
            ),
            SizedBox(width: 15),
            Text(title, style: buttonTextStyle),
          ],
        )
      ],
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(TaskPickerHeader oldDelegate) {
    return oldDelegate.title != title;
  }
}
