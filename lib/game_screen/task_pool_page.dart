import 'package:flutter/material.dart';
import 'package:flutter_template/views/widgets/work_items/tasks_button_header.dart';
import 'package:flutter_template/views/widgets/work_items/tasks_section_header.dart';

import '../rpg_layout_builder.dart';

enum TaskPoolDisplay { all, inProgress, completed }

class TaskPoolPage extends StatelessWidget {
  final TaskPoolDisplay display;

  const TaskPoolPage({this.display = TaskPoolDisplay.all});

  @override
  Widget build(BuildContext context) {
    return RpgLayoutBuilder(
      builder: (context, layout) {
        var slivers = <Widget>[];

        // 只有在显示进行中任务时才添加标题
        if (display == TaskPoolDisplay.inProgress ||
            display == TaskPoolDisplay.all) {
          slivers.add(
            SliverPersistentHeader(pinned: true, delegate: TasksButtonHeader()),
          );
          _buildSection(slivers, '意向客户');
        }

        if (display == TaskPoolDisplay.completed ||
            display == TaskPoolDisplay.all) {
          slivers.add(
            SliverPersistentHeader(delegate: TasksButtonHeader()),
          );
          _buildSection(slivers, '全款客户');
        }

        return Container(
          color: display == TaskPoolDisplay.completed
              ? Color.fromRGBO(229, 229, 229, 1)
              : Color.fromRGBO(241, 241, 241, 1),
          child: CustomScrollView(slivers: slivers),
        );
      },
    );
  }

  /// 使用标题和工作项列表构建任务列表的一部分。
  /// 返回在 [SliverList] 中使用的 slivers。
  void _buildSection(List<Widget> slivers, String title) {
    slivers.add(SliverPersistentHeader(delegate: TasksSectionHeader(title)));
  }
}
