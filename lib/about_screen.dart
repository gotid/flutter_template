import 'package:flutter/material.dart';
import 'package:flutter_template/rpg_layout_builder.dart';
import 'package:flutter_template/style.dart';
import 'package:flutter_template/views/widgets/buttons/welcome_button.dart';

class AboutScreen extends StatelessWidget {
  static const double _horizontalPadding = 33;

  @override
  Widget build(BuildContext context) {
    return bb(context);
  }

  Scaffold bb(BuildContext context) {
    return Scaffold(
      body: Container(
        color: contentColor,
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom + 33,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: ButtonTheme(
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    shape: null,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 41),
                      Text(
                        'IMOLA\n标准化运营系统',
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 5,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          height: 2, color: Colors.white.withOpacity(0.19)),
                      SizedBox(height: 27),
                      Text(
                        'V 1.0',
                        style: buttonTextStyle.apply(
                            fontSizeDelta: -4,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      SizedBox(height: 23),
                      Text(
                        'IMOLA标准化运营系统'
                        '由筑客互联使用Flutter开发',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 23),
                      Text(
                        '图形和动画是'
                        '使用Flare创建的',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 58),
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          child: WelcomeButton(
                            onPressed: () => Navigator.of(context).pop(),
                            background: Colors.white.withOpacity(0.15),
                            label: '完成',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Scaffold aa(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      appBar: AppBar(
        backgroundColor: contentColor,
        elevation: 0,
        // leading: Icon(
        //   Icons.arrow_back,
        //   color: Colors.white,
        // ),
      ),
      body: SafeArea(
        child: Container(
          // color: contentColor,
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Column(
            children: <Widget>[Text('aa')],
          ),
        ),
      ),
    );
  }
}
