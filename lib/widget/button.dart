import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Color color;
  final String text;
  final GestureTapCallback onPressed;

  const Button({Key key, this.color, this.text, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: color,
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: Text(text),
        ),
      ),
    );
  }
}
