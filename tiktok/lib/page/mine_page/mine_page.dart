import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/page/mine_page/mine_page_controller.dart';
import 'package:tiktok/widget/text_count.dart';

import '../../widget/t_image.dart';
import '../../widget/title_page_view/title_page_view.dart';
import '../video_list/video_list.dart';

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
    return Scaffold(
        body: Stack(
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
          // uid
          Padding(
              padding: EdgeInsets.only(top: 18, left: 16),
              child: Text(_controller.uid,
                  style: TextStyle(color: Color(0xBB161822), fontSize: 14, decoration: TextDecoration.none))),
          // divider
          Container(
            height: 1 / MediaQueryData.fromWindow(window).devicePixelRatio,
            margin: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 12),
            color: Color(0xFFE1E1E3),
          ),
          // profile
          Container(
            height: 18,
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text('点击添加介绍，让大家认识你...',
                    style: TextStyle(color: Color(0xFF72737A), fontSize: 12, decoration: TextDecoration.none)),
                SizedBox(width: 2),
                TImage('asset/image/edit.png', height: 12)
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 16),
              Expanded(
                  child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      color: Color(0xFFF0F0F2),
                      child: Text('编辑资料',
                          style: TextStyle(color: Color(0xFF161812), fontSize: 16, decoration: TextDecoration.none)))),
              SizedBox(width: 5),
              Expanded(
                  child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      color: Color(0xFFF0F0F2),
                      child: Text('添加朋友',
                          style: TextStyle(color: Color(0xFF161812), fontSize: 16, decoration: TextDecoration.none)))),
              SizedBox(width: 16)
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: TitlePageView(
                pageView: PageView(
                  children: [
                    VideoList("asset:///asset/video/video1.mp4"),
                    VideoList("asset:///asset/video/video1.mp4"),
                    VideoList("asset:///asset/video/video1.mp4"),
                    VideoList("asset:///asset/video/video1.mp4"),
                  ],
                ),
                title: ['作品', '私密', '收藏', '喜欢']),
          )
        ]),
        Padding(
            padding: EdgeInsets.only(top: 96, left: 16),
            child: GestureDetector(
                child: Obx(() => TImage(_controller.avatarUrl.value, shape: Shape.CIRCLE, radius: 40)),
                onTap: () async {
                  _controller.onTapAvatar();
                }))
      ],
    ));
  }
}
