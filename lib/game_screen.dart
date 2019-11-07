import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/game_screen_wide.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var width = query.size.width;

    if (width != 0) {
      // 禁止旋转到横屏。
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    return GameScreenWide();
  }
}
