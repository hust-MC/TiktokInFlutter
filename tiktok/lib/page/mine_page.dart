import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/channel_util.dart';
import 'package:tiktok/mc_route.dart';

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
        Column(children: [
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
          )
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
                      _backgroundUrl = fileUrl;
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
