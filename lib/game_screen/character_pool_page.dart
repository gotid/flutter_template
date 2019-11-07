import 'package:flutter/material.dart';
import 'package:flutter_template/rpg_layout_builder.dart';
import 'package:flutter_template/style.dart';

import 'character_modal.dart';

/// 显示玩家可用的角色列表。
class CharacterPoolPage extends StatefulWidget {
  final int numColumns;

  const CharacterPoolPage({this.numColumns});

  @override
  _CharacterPoolPageState createState() => _CharacterPoolPageState();
}

class _CharacterPoolPageState extends State<CharacterPoolPage> {
  get _gridStructure => SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.numColumns,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 0.65,
      );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GridView.builder(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 128),
          itemCount: 30,
          itemBuilder: (context, index) => CharacterListItem(),
          gridDelegate: _gridStructure,
        ),
      ],
    );
  }
}

/// 显示单个角色 [Character] 的当前状态。
/// 轻击角色打开一个模态窗口，提供有关统计和升级选项的更多详情。
class CharacterListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Stack(
        children: [
          const CharacterBox(),
          CharacterDisplay(),
        ],
      ),
    );
  }
}

/// 角色盒子，提供容器的边框和阴影修饰
class CharacterBox extends StatelessWidget {
  const CharacterBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(69, 69, 82, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
            )
          ]),
      // child: Text('$index'),
    );
  }
}

class CharacterDisplay extends StatelessWidget {
  get _inkWellBorder =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          _showModal(context);
        },
        customBorder: _inkWellBorder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text('客户信息'),
              ),
            ),
            SizedBox(height: 20),
            HiringInformation(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CharacterModal();
        });
  }
}

class HiringInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RpgLayoutBuilder(
      builder: (context, layout) {
        double textScale = layout == RpgLayout.ultraWide ? 1.25 : 1;
        return Opacity(
          opacity: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, color: attentionColor),
              SizedBox(width: 4),
              Text(
                '查看',
                style: contentStyle.apply(
                    fontSizeDelta: -2,
                    fontSizeFactor: textScale,
                    color: attentionColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
