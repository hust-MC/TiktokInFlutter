import 'package:flutter/material.dart';
import 'package:player/player.dart';
import 'package:player/video_view.dart';

import '../../main.dart';
import '../../mc_route.dart';
import 'controller/video_controller.dart';

class VideoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  late VideoController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoController();
    _controller.init().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: _controller.dataList?.length,
            itemBuilder: (context, index) {
              // 实际羡慕中， 通过dateList[index]取出url
              return GestureDetector(
                  child: _controller.dataList == null
                      ? Container() // 加载提示或者骨架屏
                      : AbsorbPointer(
                          absorbing: true,
                          child: VideoView(Player()
                            ..setCommonDataSource(_controller.dataList![index].url,
                                type: SourceType.net, autoPlay: true))),
                  onTap: () async =>
                      await router.push(name: MCRouter.playerPage, arguments: _controller.dataList![index].url));
            }));
  }
}
