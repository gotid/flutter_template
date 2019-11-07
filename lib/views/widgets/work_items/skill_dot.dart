import 'package:flutter/material.dart';

class SkillDot extends StatelessWidget {
  final int index;

  const SkillDot({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? Color.fromRGBO(0, 179, 184, 1)
              : Color.fromRGBO(84, 114, 239, 1),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
