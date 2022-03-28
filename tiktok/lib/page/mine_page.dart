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
  String url = 'asset/image/default_photo.jpg';
  static const image_height = 120.0;

  _MinePageState() {
    SharedPreferences.getInstance().then((sp) {
      String? fileUrl = sp.getString(MCRouter.key_url);
      if (fileUrl != null && fileUrl.isNotEmpty) {
        setState(() {
          url = fileUrl;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: image_height,
          child: GestureDetector(
              child: TImage(url, fit: BoxFit.cover),
              onTap: () async {
                ChannelUtil.hideBottomBar(true);
                var fileUrl = await router
                    .push(name: MCRouter.photo_picker, arguments: {MCRouter.key_url: url, "height": "$image_height"});
                if (fileUrl is String) {
                  setState(() {
                    url = fileUrl;
                  });

                  SharedPreferences.getInstance().then((sp) {
                    sp.setString(MCRouter.key_url, fileUrl);
                  });
                }
              }),
        )
      ],
    );
  }
}
