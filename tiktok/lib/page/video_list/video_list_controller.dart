import 'dart:math';

import 'package:get/get.dart';

import 'video_model.dart';

class VideoListController extends GetxController {
  var models = <VideoModel>[].obs;

  VideoListController() {
    var total = Random().nextInt(10);
    for (int i = 0; i < total; i++) {
      models.add(VideoModel("asset:///asset/video/video1.mp4", count: Random().nextInt(1000)));
    }
  }
}
