import 'package:flutter_module/widget/video_page/controller/video_controller.dart';

import '../server_data.dart';

class PublicController extends VideoController {
  @override
  String get spKey => 'videoData';

  @override
  String get videoData => ServerData.fetchDataFromServer();
}
