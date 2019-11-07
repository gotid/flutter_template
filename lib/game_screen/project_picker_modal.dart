import 'package:flutter/material.dart';

import 'package:flutter_template/style.dart';
import 'package:flutter_template/views/widgets/task_picker/task_picker_header.dart';
import 'package:flutter_template/views/widgets/task_picker/task_picker_item.dart';

class ProjectPickerModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var testCount = 3;
    var alpha = _buildTaskPickerSlivers(testCount);
    var slivers = <Widget>[
      SliverPadding(
        padding: EdgeInsets.only(top: 15),
        sliver: SliverPersistentHeader(
          pinned: false,
          delegate: TaskPickerHeader('第1次跟进'),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return alpha[index];
          },
          childCount: testCount,
        ),
      ),
      SliverPersistentHeader(
        pinned: false,
        delegate: TaskPickerHeader('第2次跟进'),
      ),
      SliverPersistentHeader(
        pinned: false,
        delegate: TaskPickerHeader('第3次跟进', showLine: false),
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: modalMaxWidth),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Container(
            color: modalBackgroundColor,
            child: CustomScrollView(slivers: slivers),
          ),
        ),
      ),
    );
  }

  List<TaskPickerItem> _buildTaskPickerSlivers(int count) {
    return List.generate(count, (i) => TaskPickerItem(i)).toList();
  }
}
