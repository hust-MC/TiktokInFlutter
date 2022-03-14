import 'package:flutter/material.dart';

class PhotoPickerPage extends StatelessWidget {
  final String fileUrl;

  const PhotoPickerPage(this.fileUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            child: Image.asset(fileUrl), onTap: () => print('MCLOG, ontap'),), color: Colors.black, height: double.infinity, width: double.infinity);
  }
}
