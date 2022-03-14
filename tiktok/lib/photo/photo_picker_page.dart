import 'package:flutter/material.dart';

class PhotoPickerPage extends StatelessWidget {
  final String fileUrl;

  const PhotoPickerPage(this.fileUrl);

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset(fileUrl), color: Colors.black,);
  }

}