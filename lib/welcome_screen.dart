import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/style.dart';

import 'rpg_layout_builder.dart';
import 'views/widgets/buttons/welcome_button.dart';

const double _horizontalPadding = 33;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    // 隐藏窗口边缘
    var query = MediaQuery.of(context);
    var width = query.size.width;
    if (!_initialized && width != 0 && width < blockLandscapeThreshold) {
      // 禁止旋转到横屏。
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    return Scaffold(
      body: Container(
        child: RpgLayoutBuilder(
            builder: (context, layout) => layout == RpgLayout.slim
                ? _WelcomeScreenSlim(
                    onStart: _pressStartGame,
                    onAbout: _pressAbout,
                  )
                : _WelcomeScreenWide(
                    onStart: _pressStartGame,
                    onAbout: _pressAbout,
                  )),
      ),
    );
  }

  void _pressStartGame() {
    Navigator.pushNamed(context, '/container');
  }

  void _pressAbout() {
    Navigator.of(context).pushNamed('/about');
  }
}

/// 构建修身版欢迎屏幕（通常在竖屏移动设备上展示）
class _WelcomeScreenSlim extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onAbout;

  const _WelcomeScreenSlim({Key key, this.onStart, this.onAbout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 83,
          bottom: 56,
          left: _horizontalPadding,
          right: _horizontalPadding),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: modalMaxWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 开始屏幕 Hero
            // Expanded(
            //   child: StartScreenHero(
            //     filename: 'assets/flare/TheJack.flr',
            //     alignment: Alignment.bottomCenter,
            //     fit: BoxFit.contain,
            //     gradient: contentColor,
            //   ),
            // ),
            Expanded(
              child: Container(),
            ),

            // 标题
            _Title(),

            // 欢迎按钮 —— 开始游戏
            Padding(
              padding: EdgeInsets.only(top: 29, bottom: 15),
              child: WelcomeButton(
                  key: Key('start_game'),
                  onPressed: onStart,
                  background: Colors.orange,
                  icon: Icons.chevron_right,
                  label: '开始'),
            ),

            // 欢迎按钮 —— 关于我们
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: WelcomeButton(
                  onPressed: onAbout,
                  background: Colors.white.withOpacity(0.15),
                  icon: Icons.settings,
                  label: '关于'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 构建宽屏版本欢迎屏幕（更好适配电视、桌面和平板）
class _WelcomeScreenWide extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onAbout;

  const _WelcomeScreenWide({Key key, this.onStart, this.onAbout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var thirdWidth = size.width / 3;
    var thirdHeight = size.height / 3;

    return RpgLayoutBuilder(
      builder: (context, layout) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 开始屏幕 Hero
          // Container(
          //   width: thirdWidth,
          //   height: thirdHeight * 2,
          //   child: StartScreenHero(
          //     filename: 'assets/flare/TheJack.flr',
          //     alignment: Alignment.center,
          //     fit: BoxFit.fitHeight,
          //     gradient: contentColor,
          //   ),
          // ),
          Container(
            width: thirdWidth,
            height: thirdHeight * 2,
            color: contentColor,
          ),
          SizedBox(width: 10),
          SizedBox(
            width:
                layout == RpgLayout.ultraWide ? thirdWidth * 0.702 : thirdWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _Title(),
                SizedBox(height: layout == RpgLayout.ultraWide ? 87 : 29),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: WelcomeButton(
                        key: Key('start_game'),
                        fontSize: layout == RpgLayout.ultraWide ? 20 : 16,
                        background: Colors.orange,
                        icon: Icons.chevron_right,
                        label: '开始',
                        onPressed: onStart,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: WelcomeButton(
                        fontSize: layout == RpgLayout.ultraWide ? 20 : 16,
                        background: Colors.white.withOpacity(0.15),
                        icon: Icons.settings,
                        label: '关于',
                        onPressed: onAbout,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RpgLayoutBuilder(
        builder: (context, layout) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'IMOLA\n标准化运营系统',
                  style: TextStyle(
                      fontSize: layout == RpgLayout.ultraWide ? 48 : 30,
                      letterSpacing: 5),
                ),
                SizedBox(height: layout == RpgLayout.ultraWide ? 24 : 12),
                Container(height: 2, color: Colors.white.withOpacity(0.19)),
                SizedBox(height: layout == RpgLayout.ultraWide ? 28 : 12),
                Text('构建你的团队, 消灭问题, 不断前进。',
                    style: TextStyle(
                        fontSize: layout == RpgLayout.ultraWide ? 24 : 20)),
                SizedBox(height: 25),
                layout == RpgLayout.ultraWide
                    ? Image.asset('assets/images/2.0x/2dimensions.png',
                        scale: 1.75)
                    : Image.asset('assets/images/2dimensions.png')
              ],
            ));
  }
}
