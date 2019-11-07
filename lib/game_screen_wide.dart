import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/game_screen/character_pool_page.dart';
import 'package:flutter_template/slide_list_screen.dart';
import 'package:flutter_template/views/widgets/app_bar/coin_badge.dart';
import 'package:flutter_template/views/widgets/app_bar/stat_separator.dart';
import 'package:flutter_template/views/widgets/app_bar/users_badge.dart';

import 'game_screen/task_pool_page.dart';
import 'rpg_layout_builder.dart';
import 'style.dart';
import 'views/widgets/app_bar/joy_badge.dart';

class GameScreenWide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var width = query.size.width;

    if (width != 0 && width < ultraWideLayoutThreshold) {
      // 禁止旋转到横屏。
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    var screenWidth = MediaQuery.of(context).size.width;
    var taskColumnWidth = min(modalMaxWidth, screenWidth / 3);
    var charactersWidth = screenWidth - taskColumnWidth * 2;
    var numCharacterColumns =
        (charactersWidth / idealCharacterWidth).round().clamp(2, 4).toInt();

    return RpgLayoutBuilder(builder: (context, layout) {
      double statsWidth = layout == RpgLayout.ultraWide ? 300 : 165;
      return Scaffold(
        backgroundColor: Color.fromRGBO(59, 59, 73, 1),
        appBar: AppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          // 这里使用 RepaintBoundary，因为这部分UI经常变化。
          title: RepaintBoundary(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: statSeperatorColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: statsWidth,
                    child: UsersBadge(101),
                  ),
                  StatSeparator(),
                  Container(
                    width: statsWidth,
                    child: JoyBadge(0),
                  ),
                  StatSeparator(),
                  Container(
                    width: statsWidth,
                    child: CoinBadge(5),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Row(
          children: <Widget>[
            SizedBox(
              width: charactersWidth,
              // child: CharacterPoolPage(numColumns: numCharacterColumns),
              child: SlideListScreen(charactersWidth),
            ),
            SizedBox(
              width: taskColumnWidth,
              child: TaskPoolPage(display: TaskPoolDisplay.inProgress),
            ),
            SizedBox(
              width: taskColumnWidth,
              child: TaskPoolPage(display: TaskPoolDisplay.completed),
            ),
          ],
        ),
      );
    });
  }
}
