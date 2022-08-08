import 'package:flutter/material.dart';
import 'package:flutter_module/mc_router.dart';
import 'package:flutter_module/page/mine_page/mine_page_controller.dart';
import 'package:flutter_module/widget/TImage.dart';
import 'package:get/get.dart';

import '../../main.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  static const image_height = 138.5;

  final _controller = Get.put(MinePageController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          height: image_height,
          child: GestureDetector(
              child: TImage(_controller.backgroundUrl, fit: BoxFit.cover),
              onTap: () async {
                var fileUrl = await router
                    .push(name: MCRouter.photoPicker, arguments: {MCRouter.key_url: _controller.backgroundUrl});

                // 增加类型判断
                if (fileUrl is String) {
                  _controller.backgroundUrl = fileUrl;
                }
              }))
    ]);
  }
}
