import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_module/page/camera_page/camera_page_controller.dart';
import 'package:flutter_module/widget/t_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../gen/assets.gen.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraPageController();

    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
      Obx(() =>
          _controller.cameraController == null || !_controller.cameraController!.value.isInitialized
              ? Container(color: Colors.black)
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: CameraPreview(_controller.cameraController!))),
      Padding(
          padding: EdgeInsets.only(top: 38, left: 19),
          child: GestureDetector(
              child: TImage(Assets.image.close.path, height: 18, width: 18),
              onTap: () {
                _controller.onCloseTap();
              })),
      Align(
          alignment: Alignment.topRight,
          child: Padding(
              padding: EdgeInsets.only(top: 35, right: 14),
              child: Column(children: [
                GestureDetector(
                    child: _buildIcon(Assets.image.rotate.path, '翻转'),
                    onTap: () {
                      _controller.onSwitchCamera();
                    }),
                SizedBox(height: 16),
                GestureDetector(
                    child: _buildIcon(Assets.image.clock.path, '倒计时'),
                    onTap: () {
                      Future.delayed(Duration(seconds: 3), () {
                        _controller.takePhotoAndUpload();
                      });
                    }),
                SizedBox(height: 16),
                GestureDetector(
                  child: Obx(() => _buildIcon(
                      _controller.flash ? Assets.image.flashOn.path : Assets.image.flashOff.path,
                      '闪光灯')),
                  onTap: () {
                    _controller.cameraController
                        ?.setFlashMode(_controller.flash ? FlashMode.off : FlashMode.always);
                    _controller.flash = !_controller.flash;
                  },
                )
              ]))),
      Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 62, bottom: 110),
              child: GestureDetector(
                child: Column(
                  children: [
                    TImage(Assets.image.gallery.path, height: 40, width: 40),
                    SizedBox(height: 10),
                    Text('相册',
                        style: TextStyle(
                            color: Colors.white, fontSize: 12, decoration: TextDecoration.none))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
                onTap: () async {
                  var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  var path = pickedFile?.path;
                  if (path != null) {
                    print("upload picture: $path");
                  }
                },
              ))),
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.only(bottom: 115),
              child: GestureDetector(
                  child: Container(
                      width: 75,
                      height: 75,
                      child: Padding(
                        child: TImage(Assets.image.flashOn.path, height: 33, width: 33),
                        padding: EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                      ),
                      decoration: new BoxDecoration(
                        color: Color(0xffff2c54),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: new Border.all(width: 4, color: Colors.white),
                      )),
                  onTap: () {
                    _controller.takePhotoAndUpload();
                  }))),
    ]));
  }

  Widget _buildIcon(String iconPath, String title) {
    return Column(
      children: [
        TImage(iconPath, width: 25, height: 25),
        SizedBox(height: 6),
        Text(title,
            style: TextStyle(color: Colors.white, fontSize: 10, decoration: TextDecoration.none))
      ],
    );
  }
}
