import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_module/page/mine_page/mine_page_controller.dart';
import 'package:flutter_module/page/video_list/video_list_controller.dart';
import 'package:flutter_module/widget/text_count.dart';

import '../../gen/assets.gen.dart';
import '../../widget/t_image.dart';
import '../../widget/title_page_view/title_page_controller.dart';
import '../../widget/title_page_view/title_page_view.dart';
import '../video_list/video_list.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with SingleTickerProviderStateMixin {
  final _controller = Get.put(MinePageController());

  late ScrollController _scrollViewController;
  late TabController _tabController;

  static const image_height = 120.0;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
          body: NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Container(
                        alignment: Alignment.centerLeft,
                        //头部整个背景颜色
                        height: double.infinity,
                        color: Color(0xfffefdfd),
                        child: _buildBanner(),
                      ),
                    ),
                    bottom: TabBar(
                        controller: _tabController,
                        tabs: [Tab(text: "aaa"), Tab(text: "bbb"), Tab(text: "ccc"), Tab(text: "ddd")]),
                  )
                ];
              },
              body: Text('MC'))),
    );
  }

  Widget _buildBanner() {
    return Stack(children: [
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
            padding: EdgeInsets.only(top: 30, left: 19),
            child: Obx(
              () => Text(_controller.name.value,
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
            )),
        // uid
        Padding(
            padding: EdgeInsets.only(top: 5, left: 19),
            child: Text(_controller.uid,
                style: TextStyle(color: Colors.black, fontSize: 11, decoration: TextDecoration.none))),
        // divider
        Container(
          height: 1 / MediaQueryData.fromWindow(window).devicePixelRatio,
          margin: EdgeInsets.only(left: 19, right: 16, top: 10, bottom: 12),
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
              TImage(Assets.image.edit.assetName, height: 12)
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFE2D54),
                borderRadius: BorderRadius.circular(4), // 圆角
              ),
              width: double.infinity,
              height: 36,
              child: Text('+ 关注',
                  style: TextStyle(color: Color(0xFFFBFBFC), fontSize: 15, decoration: TextDecoration.none)),
              alignment: Alignment.center,
            )),
        SizedBox(height: 30),
      ]),
      Padding(
          padding: EdgeInsets.only(top: 96, left: 19),
          child: GestureDetector(
              child: Obx(() => TImage(_controller.avatarUrl.value, shape: Shape.CIRCLE, radius: 40)),
              onTap: () async {
                _controller.onTapAvatar();
              }))
    ]);
  }

  //banner下面的按钮
  Widget _buildButtons() {
    return Expanded(
      child: Row(
        children: <Widget>[
          _buildButtonItem(Icons.chat, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.pages, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.phone_android, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.print, "xxxx"),
        ],
      ),
    );
  }

  Widget _buildButtonItem(IconData icon, String text) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 28.0),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(text, style: TextStyle(color: Color(0xff999999), fontSize: 12)),
        )
      ],
    ));
  }

  Widget _buildTabBarBg() {
    return Container(
      //TabBar圆角背景颜色
      height: 50,
      child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Container(color: Colors.white)),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.grey,
              height: 1,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(color: Colors.white, child: ListTile(title: Text("$s第$index 个条目")));
        });
  }
}
