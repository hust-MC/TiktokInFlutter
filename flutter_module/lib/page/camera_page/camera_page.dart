import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_module/widget/t_image.dart';

import '../../gen/assets.gen.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();

    availableCameras().then((value) {
      cameras = value;
      controller = CameraController(cameras[0], ResolutionPreset.medium);
      controller?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
      controller == null || !controller!.value.isInitialized
          ? Container(color: Colors.black)
          : Container(
              width: double.infinity, height: double.infinity, child: CameraPreview(controller!)),
      Padding(
          padding: EdgeInsets.only(top: 38, left: 19),
          child: TImage(Assets.image.close.path, height: 18, width: 18)),
      Align(
          alignment: Alignment.topRight,
          child: Padding(
              padding: EdgeInsets.only(top: 35, right: 14),
              child: Column(children: [
                _buildIcon(Assets.image.rotate.path, '翻转'),
                SizedBox(height: 16),
                _buildIcon(Assets.image.clock.path, '倒计时'),
                SizedBox(height: 16),
                _buildIcon(Assets.image.flashOn.path, '闪光灯'),
              ]))),
      Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 62, bottom: 110),
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
          )),
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.only(bottom: 115),
              child: Container(
                  width: 75,
                  height: 75,
                  child: Padding(
                    child: TImage(Assets.image.flashOn.path, height: 33, width: 33),
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                  ),
                  decoration: new BoxDecoration(
                    color: Color(0xffff2c54),
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    //设置四周边框
                    border: new Border.all(width: 4, color: Colors.white),
                  )))),
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
