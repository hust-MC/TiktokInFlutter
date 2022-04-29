import 'package:flutter/material.dart';
import 'package:tiktok/gen/assets.gen.dart';
import 'package:tiktok/widget/t_image.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(
        children: [TImage(Assets.image.add.assetName)],
      )
    ]));
  }
}
