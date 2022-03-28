import 'package:flutter/cupertino.dart';

class TextCount extends StatelessWidget {
  final text;
  final textStyle;
  final int num;
  final numStyle;

  TextCount(this.text,
      {this.textStyle = const TextStyle(
        color: Color(0xff72737a),
        fontSize: 13,
        decoration: TextDecoration.none,
      ),
      this.num = 0,
      this.numStyle = const TextStyle(
        color: Color(0xff161822),
        fontSize: 13,
        decoration: TextDecoration.none,
      )});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(text, style: textStyle), SizedBox(height: 3), Text(num.toString(), style: numStyle)]);
  }
}
