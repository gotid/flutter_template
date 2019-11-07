import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/game_screen/add_task_button.dart';
import 'package:flutter_template/game_screen/project_picker_modal.dart';

class TasksButtonHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: AddTaskButton(
                icon: Icons.add,
                color: Color(0xff5472ee),
                label: '跟进',
                count: 2,
                onPressed: () async {
                  await showCupertinoModalPopup(
                      context: context,
                      builder: (context) => ProjectPickerModal());
                }),
          ),
          SizedBox(width: 10),
          Expanded(
            child: AddTaskButton(
              icon: Icons.track_changes,
              color: Color(0xffeb2875),
              label: '复盘',
              count: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 标题未在视窗收缩时的尺寸
  @override
  double get maxExtent => 55;

  // 标题在视窗收缩时的尺寸
  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
