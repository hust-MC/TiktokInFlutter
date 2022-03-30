import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/page/mine_page/mine_page_controller.dart';
import 'package:tiktok/widget/text_count.dart';

import '../../widget/TImage.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final _controller = Get.put(MinePageController());

  static const image_height = 120.0;

  _MinePageState() {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 背景墙
          Container(
            width: double.infinity,
            height: image_height,
            child: GestureDetector(
                child: Obx(() => TImage(_controller.backgroundUrl.value, fit: BoxFit.cover)),
                onTap: () async {
                  _controller.onTapBackground();
                }),
          ),
          SizedBox(height: 3),
          // 赞、关注、粉丝
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(width: 10),
            TextCount('获赞'),
            TextCount('关注'),
            TextCount('粉丝'),
          ]),
          // 姓名
          Padding(
              padding: EdgeInsets.only(top: 30, left: 16),
              child: Obx(
                () => Text(_controller.name.value,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none)),
              )),
          Padding(
              padding: EdgeInsets.only(top: 30, left: 16),
              child: Text('',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.none)))
        ]),
        Padding(
            padding: EdgeInsets.only(top: 96, left: 16),
            child: GestureDetector(
                child: Obx(() => TImage(_controller.avatarUrl.value, shape: Shape.CIRCLE, radius: 40)),
                onTap: () async {
                  _controller.onTapAvatar();
                }))
      ],
    );
  }
}
