import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/style.dart';
import 'package:flutter_template/views/widgets/buttons/wide_button.dart';
import 'package:flutter_template/views/widgets/flare/skill_icon.dart';
import 'package:flutter_template/views/widgets/prowess_progress.dart';

/// 显示角色的状态并提供升级选项。
class CharacterModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: modalMaxWidth),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 280),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CharacterImage(),
                CharacterStats(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 角色图片动画
class CharacterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: modalMaxWidth * 0.75),
        child: Stack(
          children: <Widget>[
            // 底层：背景色及圆角
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(25, 25, 30, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
            ),

            // 动画角色层
            Positioned.fill(
              child: FlareActor(
                'assets/flare/TheJack.flr',
                alignment: Alignment.bottomCenter,
                shouldClip: false,
                fit: BoxFit.contain,
                // animation: 'idle',
              ),
            ),

            // 关闭按钮层
            Align(
              alignment: Alignment.topRight,
              child: FlatButton(
                key: ValueKey('close-character-modal'),
                padding: EdgeInsets.all(0),
                shape: null,
                child: Icon(
                  Icons.cancel,
                  color: Color.fromRGBO(250, 250, 255, .5),
                  semanticLabel: '关闭',
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 角色统计数据
class CharacterStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '等级 1',
                style: contentStyle.apply(color: secondaryContentColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, bottom: 6),
                child: Text(
                  '室内设计师——杰克马',
                  style: contentLargeStyle.apply(color: secondaryContentColor),
                ),
              ),
              Text(
                '有什么问题吗？杰克可以帮助！他带着通气管去任何地方，因为他总是做好了准备',
                style: contentSmallStyle.apply(color: secondaryContentColor),
              ),
              Column(
                children: List.generate(3, (i) => SkillDisplay()).toList(),
              ),
              SizedBox(height: 40),
              UpgradeHireButton(),
            ],
          ),
        ),
      ),
    );
  }
}

/// 技能展示
class SkillDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: <Widget>[
                  SkillIcon(
                    flareFileName: 'assets/flare/CodeIcon.flr',
                    color: Color.fromRGBO(69, 69, 82, 1),
                  ),
                  SizedBox(width: 10),
                  Text('Coding',
                      style: contentStyle.apply(color: skillTextColor))
                ],
              ),
              Expanded(child: Container()),
              Text('1', style: contentLargeStyle)
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: ProwessProgress(
                progress: .1,
              )),
        ],
      ),
    );
  }
}

/// 升级雇佣按钮
class UpgradeHireButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WideButton(
      background: Color.fromRGBO(84, 114, 239, 1),
      onPressed: () {},
      child: Row(
        children: <Widget>[
          Text(
            '升级',
            style: buttonTextStyle.apply(color: Colors.white),
          ),
          Expanded(child: Container()),
          SizedBox(
            width: 20,
            height: 20,
            child: FlareActor(
              'assets/flare/Coin.flr',
              isPaused: true,
            ),
          ),
          SizedBox(width: 4),
          Text(
            '200',
            style: buttonTextStyle.apply(
              color: Color.fromRGBO(241, 241, 241, 1),
              fontSizeDelta: -2,
            ),
          )
        ],
      ),
    );
  }
}
