import 'package:flutter_module/widget/video_page/controller/video_controller.dart';
import 'package:flutter_module/widget/video_page/server_data.dart';

class PrivateController extends VideoController {

  @override
  String get spKey => 'privateData';
  @override
  String get videoData => ServerData.fetchPrivateFromServer();
}