import 'package:flutter/material.dart';

class ProwessProgress extends StatefulWidget {
  final double progress;

  const ProwessProgress({Key key, @required this.progress}) : super(key: key);

  @override
  _ProwessProgressState createState() => _ProwessProgressState();
}

class _ProwessProgressState extends State<ProwessProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _progressTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _progressTween = Tween<double>(begin: widget.progress, end: widget.progress)
        .animate(_animationController);
    super.initState();
  }

  @override
  void didUpdateWidget(ProwessProgress oldWidget) {
    setState(() {
      _progressTween =
          Tween<double>(begin: _progressTween.value, end: widget.progress)
              .animate(_animationController);
      _animationController.reset();
      _animationController.forward();
      print(_progressTween.value);
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              borderRadius: BorderRadius.circular(3.5),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => FractionallySizedBox(
              widthFactor: _progressTween.value,
              child: Container(
                height: 7,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 179, 184, 1),
                  borderRadius: BorderRadius.circular(3.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
