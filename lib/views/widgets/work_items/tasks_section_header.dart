import 'package:flutter/material.dart';
import 'package:flutter_template/style.dart';

/// 这是一个简单的用于任务列表的文本标题。
class TasksSectionHeader extends SliverPersistentHeaderDelegate {
  final String title;

  TasksSectionHeader(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        title,
        style: buttonTextStyle.apply(color: secondaryContentColor),
      ),
    );
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(TasksSectionHeader oldDelegate) {
    return title != oldDelegate.title;
  }
}
