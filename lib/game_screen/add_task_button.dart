import 'package:flutter/material.dart';
import 'package:flutter_template/style.dart';

class AddTaskButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String label;
  final int count;
  final VoidCallback onPressed;

  const AddTaskButton(
      {Key key,
      this.icon,
      this.color,
      this.label,
      this.count = 0,
      this.onPressed})
      : super(key: key);

  @override
  _AddTaskButtonState createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  bool get isDisabled => widget.count == 0;

  void onTap() {
    if (widget.onPressed != null) {
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isDisabled ? disabledTaskColor : widget.color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isDisabled
              ? null
              : [
                  BoxShadow(
                      color: widget.color.withOpacity(0.3),
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      spreadRadius: 0),
                ],
        ),
        child: Row(
          children: <Widget>[
            Icon(widget.icon,
                color: isDisabled ? disabledTaskColor : Colors.white),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                widget.label,
                style: buttonTextStyle.apply(
                    color: isDisabled ? disabledTaskColor : Colors.white),
              ),
            ),
            isDisabled
                ? Container()
                : Container(
                    constraints: BoxConstraints(
                        minWidth: 26, minHeight: 26, maxHeight: 26),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                        child: Text(widget.count.toString(),
                            style: buttonTextStyle.apply(color: widget.color))),
                  )
          ],
        ),
      ),
    );
  }
}
