import 'package:flutter_module/widget/video_page/controller/video_controller.dart';
import 'package:flutter_module/widget/video_page/server_data.dart';

class MarkController extends VideoController {
  @override
  String get spKey => 'markData';

  @override
  String get videoData => ServerData.fetchMarkFromServer();
}