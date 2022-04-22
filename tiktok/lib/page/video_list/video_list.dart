import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

// ignore: must_be_immutable
class VideoList extends StatefulWidget {
  final String _playUrl;
  final int loop;
  int startSeconds = 0; //播放起始时间

  VideoList(
    this._playUrl, {
    this.loop = -1,
    this.startSeconds = 0,
  });

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget._playUrl, autoPlay: true);
    player.setLoop(widget.loop);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return FijkView(player: player);
  }
}
