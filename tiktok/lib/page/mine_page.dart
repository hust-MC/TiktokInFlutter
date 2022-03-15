import 'package:flutter/material.dart';
import 'package:tiktok/channel_util.dart';
import 'package:tiktok/mc_route.dart';

import '../main.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          child: GestureDetector(
              child: Image.asset('asset/image/default_photo.jpg', fit: BoxFit.fill),
              onTap: () {
                ChannelUtil.hideBottomBar(true);
                router.push(name: MCRouter.photo_picker);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //   return PhotoPickerPage('asset/image/default_photo.jpg');
                // }));
              }),
        )
      ],
    );
  }
}
