import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/channel_util.dart';
import 'package:tiktok/widget/TImage.dart';

import '../main.dart';

// ignore: must_be_immutable
class PhotoPickerPage extends StatelessWidget {
  final String fileUrl;
  final double? height;
  final double? width;
  String? result;

  PhotoPickerPage(this.fileUrl, {this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
          Align(
            child: GestureDetector(
                child: TImage(fileUrl, height: height, width: width),
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
                      print("PICK image: click");

                      var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      result = pickedFile?.path;
                      if (result != null) {
                        router.popRoute(params: result);
                        ChannelUtil.hideBottomBar(false);
                      }
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
