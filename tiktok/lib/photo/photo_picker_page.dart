import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/channel_util.dart';

import '../main.dart';

class PhotoPickerPage extends StatelessWidget {
  final String fileUrl;

  const PhotoPickerPage(this.fileUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
          Align(
            child: GestureDetector(
                child: Image.asset(fileUrl),
                onTap: () {
                  router.popRoute();
                  ChannelUtil.hideBottomBar(false);
                }),
            alignment: Alignment.center,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 85),
                child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      color: Color(0xff262626),
                      width: 190,
                      height: 36,
                      child: Text(
                        '更换背景',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onTap: () async {
                      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
                      print("PICK image: $image");
                    }),
              ))
        ]),
        color: Colors.black,
        height: double.infinity,
        width: double.infinity);
  }

  @override
  String toStringShort() {
    return 'PhotoPickerPage, image file url: $fileUrl';
  }
}
