import 'package:flutter/material.dart';

class AnimatedUpArrow extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 1, end: 0);
  final Tween<double> _marginTween = Tween(begin: 0, end: 50);

  AnimatedUpArrow({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.only(bottom: _marginTween.evaluate(animation)),
          child: Image.asset('assets/images/up.png', width: 20, height: 24),
        ),
      ),
    );
  }
}
