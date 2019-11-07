import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/style.dart';

/// 显示游戏统计数据及其名称和值，还显示一个动画图标。
abstract class StatBadate<T extends num> extends StatefulWidget {
  final String stat;

  @required
  final String flare;

  @required
  final num statValue;

  /// 庆祝值
  T get celebrateAfter;

  const StatBadate(this.stat, this.statValue, {this.flare})
      : assert(statValue != null);

  @override
  _StatBadate<T> createState() => _StatBadate<T>();
}

class _StatBadate<T extends num> extends State<StatBadate<T>> {
  final FlareControls controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15),
        // 动画图标
        Container(
          width: 26,
          height: 26,
          child: FlareActor(
            widget.flare,
            alignment: Alignment.topCenter,
            shouldClip: false,
            fit: BoxFit.contain,
            animation: 'appear',
          ),
        ),
        SizedBox(width: 9),
        Expanded(
          child: _WideStatData(
            stat: widget.stat,
            statValue: widget.statValue,
          ),
        ),
      ],
    );
  }
}

class _WideStatData extends StatelessWidget {
  final String stat;
  final num statValue;

  const _WideStatData({Key key, this.stat, this.statValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          stat.toUpperCase(),
          style: buttonTextStyle.apply(
            color: Colors.white.withOpacity(0.5),
            fontSizeDelta: 2,
          ),
        ),
        SizedBox(width: 15),
        Text('$statValue',
            style: buttonTextStyle.apply(
              color: Colors.white,
              fontSizeDelta: -1,
              fontSizeFactor: 1.25,
            )),
      ],
    );
  }
}
