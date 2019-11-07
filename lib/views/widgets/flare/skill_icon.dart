import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SkillIcon extends StatelessWidget {
  final double width;
  final double height;
  final String flareFileName;
  final Color color;

  const SkillIcon({
    this.width = 19,
    this.height = 19,
    this.flareFileName,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlareActor(
        flareFileName,
        color: color,
        // animation: 'idle',
      ),
    );
  }
}
