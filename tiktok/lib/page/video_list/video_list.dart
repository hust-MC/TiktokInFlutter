import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart';
import 'package:tiktok/page/video_list/video_list_controller.dart';

import '../../widget/t_image.dart';
import 'video_model.dart';

class VideoList extends StatefulWidget {
  final VideoListController _controller;

  VideoList(this._controller);

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<FijkPlayer> _players = <FijkPlayer>[];
  late final VideoListController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(widget._controller);
    for (int i = 0; i < _controller.models.length; i++) {
      _players.add(FijkPlayer());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _players.forEach((element) => element.release());
    _players.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _controller.models.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          var model = _controller.models[index];
          return Stack(children: [
            buildPlayers(_players[index], model),
            Row(children: [TImage('asset/image/play.png', height: 10), Text(model.count.toString())]),
          ]);
        });
  }

  Widget buildPlayers(FijkPlayer player, VideoModel model) {
    player.setDataSource(model.url, autoPlay: true);
    player.setLoop(model.loop);

    return FijkView(player: player);
  }
}
