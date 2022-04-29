import 'dart:math';

import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import 'video_model.dart';

class VideoListController extends GetxController {
  var models = <VideoModel>[].obs;

  VideoListController() {
    var total = Random().nextInt(10);
    for (int i = 0; i < total; i++) {
      models.add(VideoModel(Assets.video.video1, count: Random().nextInt(1000)));
    }
  }
}
