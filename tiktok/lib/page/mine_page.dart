import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/channel_util.dart';
import 'package:tiktok/mc_route.dart';
import 'package:tiktok/widget/text_count.dart';

import '../main.dart';
import '../widget/TImage.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  String _backgroundUrl = 'asset/image/default_photo.jpg';
  String _avatarUrl = 'asset/image/avatar.jpg';
  String _name = '马超';

  static const image_height = 120.0;

  static const key_avatar = "keyAvatar";
  static const key_background = "keyBackground";

  _MinePageState() {
    SharedPreferences.getInstance().then((sp) {
      String? avatarUrl = sp.getString(key_avatar);
      String? backgroundUrl = sp.getString(key_background);
      if (avatarUrl?.isNotEmpty == true || backgroundUrl?.isNotEmpty == true) {
        setState(() {
          _avatarUrl = avatarUrl ?? _avatarUrl;
          _backgroundUrl = backgroundUrl ?? _backgroundUrl;
        });
      }
    });
  }

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
                child: TImage(_backgroundUrl, fit: BoxFit.cover),
                onTap: () async {
                  ChannelUtil.hideBottomBar(true);
                  var fileUrl =
                      await router.push(name: MCRouter.photo_picker, arguments: {MCRouter.key_url: _backgroundUrl});
                  if (fileUrl is String) {
                    setState(() {
                      _backgroundUrl = fileUrl;
                    });
                    SharedPreferences.getInstance().then((sp) {
                      sp.setString(key_background, fileUrl);
                    });
                  }
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
              child: Text(_name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none))),
          Padding(
              padding: EdgeInsets.only(top: 30, left: 16),
              child: Text('',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.none)))
        ]),
        Padding(
            padding: EdgeInsets.only(top: 96, left: 16),
            child: GestureDetector(
                child: TImage(_avatarUrl, shape: Shape.CIRCLE, radius: 40),
                onTap: () async {
                  ChannelUtil.hideBottomBar(true);
                  var fileUrl =
                      await router.push(name: MCRouter.photo_picker, arguments: {MCRouter.key_url: _avatarUrl});
                  if (fileUrl is String) {
                    setState(() {
                      _avatarUrl = fileUrl;
                    });

                    SharedPreferences.getInstance().then((sp) {
                      sp.setString(key_avatar, fileUrl);
                    });
                  }
                }))
      ],
    );
  }
}
