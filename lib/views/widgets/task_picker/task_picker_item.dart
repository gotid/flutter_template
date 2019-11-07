import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/rpg_layout_builder.dart';
import 'package:flutter_template/style.dart';
import 'package:flutter_template/views/widgets/work_items/skill_dot.dart';

class TaskPickerItem extends StatelessWidget {
  static const double _height = 95;
  static const double _dashWidth = 10;
  static const double _halfLineHeight = 39;
  static const double _bottomPadding = 15;
  static const double _leftPadding = 26;
  static const double _lineSpacing = 20;
  static const double _lineThickness = 2;

  final int index;
  TaskPickerItem(this.index);

  @override
  Widget build(BuildContext context) {
    List<bool> lines = List<bool>.generate(index + 1, (i) => true);
    if (index == 2) {
      lines[1] = false;
    }
    return RpgLayoutBuilder(builder: (context, layout) {
      double left = _leftPadding + (lines.length - 1) * _lineSpacing;
      var lineWidgets = [];
      for (int i = 0; i < lines.length; i++) {
        if (!lines[i]) {
          continue;
        }

        bool isLast = i == lines.length - 1;
        double lineHeight = i > 0 && isLast ? _halfLineHeight : _height;
        lineWidgets.add(Positioned.fromRect(
          rect: Rect.fromLTWH(
            _leftPadding + i * _lineSpacing,
            0,
            _lineThickness,
            lineHeight,
          ),
          child: SizedOverflowBox(
            size: Size.fromHeight(0),
            child: Container(color: treeLineColor),
          ),
        ));
      }
      return SizedBox(
        height: _height,
        child: Stack(
          children: [
            // 短横条
            Positioned.fromRect(
              rect: Rect.fromLTWH(
                  left, _halfLineHeight, _dashWidth, _lineThickness),
              child: Container(color: treeLineColor),
            ),

            // 任务盒
            Padding(
              padding: EdgeInsets.only(
                  left: left + _dashWidth, bottom: _bottomPadding, right: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          spreadRadius: 0,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 积分和色点
                      Row(
                        children: <Widget>[
                          Container(
                            width: 20,
                            height: 20,
                            child: FlareActor('assets/flare/Coin.flr'),
                          ),
                          SizedBox(width: 4),
                          Text('200', style: contentSmallStyle),
                          Expanded(child: Container()),
                          ...List.generate(2, (index) => SkillDot(index: index))
                              .toList()
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Basic UI',
                          overflow: TextOverflow.ellipsis, style: contentStyle),
                    ],
                  ),
                ),
              ),
            ),

            // 竖向线条列表
            ...lineWidgets
          ],
        ),
      );
    });
  }
}
