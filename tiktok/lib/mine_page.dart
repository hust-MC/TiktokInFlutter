import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          child: GestureDetector(child: Image.asset('asset/image/default_photo.jpg', fit: BoxFit.fill), onTap: () => print('MCLOG')),
        )
      ],
    );
  }
}
