import 'package:flutter_module/widget/video_page/controller/video_controller.dart';
import 'package:flutter_module/widget/video_page/server_data.dart';

class FavoriteController extends VideoController {
  @override
  String get spKey => 'favoriteData';

  @override
  String get videoData => ServerData.fetchFavoriteFromServer();

}