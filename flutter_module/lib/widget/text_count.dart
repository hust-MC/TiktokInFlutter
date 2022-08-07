import 'package:flutter/cupertino.dart';

class TextCount extends StatelessWidget {
  final text;
  final textStyle;
  final String num;
  final numStyle;

  TextCount(this.text,
      {this.textStyle = const TextStyle(
        color: Color(0xff747379),
        fontSize: 13,
        decoration: TextDecoration.none,
      ),
      this.num = '0',
      this.numStyle = const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xff151920),
        fontSize: 13,
        decoration: TextDecoration.none,
      )});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(text, style: textStyle), SizedBox(height: 3), Text(num, style: numStyle)]);
  }
}
