import 'package:flutter/material.dart';
import 'package:flutter_module/mc_router.dart';
import 'package:flutter_module/widget/TImage.dart';

import 'gen/assets.gen.dart';
import 'main.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

// 正常需要用Controller来管理数据，当前临时方案
String backgroundUrl = Assets.image.defaultPhoto.path;

class _MinePageState extends State<MinePage> {
  static const image_height = 138.5;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          height: image_height,
          child: GestureDetector(
              child: TImage(backgroundUrl, fit: BoxFit.cover),
              onTap: () async {
                var fileUrl = await router
                    .push(name: MCRouter.photoPicker, arguments: {MCRouter.key_url: backgroundUrl});

                // 增加类型判断
                if (fileUrl is String) {
                  backgroundUrl = fileUrl;
                  setState(() {});
                }
              }))
    ]);
  }
}
