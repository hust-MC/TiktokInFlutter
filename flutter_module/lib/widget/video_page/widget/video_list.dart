import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:player/player.dart';
import 'package:player/video_view.dart';

import '../../../gen/assets.gen.dart';
import '../../../main.dart';
import '../../../mc_route.dart';
import '../../t_image.dart';
import '../controller/video_controller.dart';

class VideoList extends StatefulWidget {
  final VideoController controller;

  @override
  State<StatefulWidget> createState() => _VideoListState();

  VideoList(this.controller);
}

class _VideoListState extends State<VideoList> {
  @override
  void initState() {
    super.initState();
    widget.controller.init().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.75),
            itemCount: widget.controller.dataList?.length,
            itemBuilder: (context, index) {
              // 实际羡慕中， 通过dateList[index]取出url
              return GestureDetector(
                  child: widget.controller.dataList == null
                      ? Container() // 加载提示或者骨架屏
                      : Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            AbsorbPointer(
                                absorbing: true,
                                child: VideoView(
                                    Player()
                                      ..setLoop(0)
                                      ..setCommonDataSource(widget.controller.dataList![index].url,
                                          type: SourceType.net, autoPlay: true),
                                    fit: FijkFit.cover)),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10, left: 15),
                                child: Row(children: [
                                  TImage(Assets.image.play.assetName, height: 12),
                                  SizedBox(width: 5),
                                  Text(
                                    widget.controller.count.toString(),
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  )
                                ]))
                          ],
                        ),
                  onTap: () async =>
                      await router.push(name: MCRouter.playerPage, arguments: widget.controller.dataList![index].url));
            }));
  }
}
