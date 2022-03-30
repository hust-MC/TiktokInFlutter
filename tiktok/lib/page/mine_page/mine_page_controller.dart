import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../channel_util.dart';
import '../../main.dart';
import '../../mc_route.dart';

class MinePageController extends GetxController {
  var backgroundUrl = 'asset/image/default_photo.jpg'.obs;
  var avatarUrl = 'asset/image/avatar.jpg'.obs;
  var name = '马超'.obs;

  static const image_height = 120.0;

  final key_avatar = "keyAvatar";
  final key_background = "keyBackground";

  MinePageController() {
    SharedPreferences.getInstance().then((sp) {
      String? newAvatarUrl = sp.getString(key_avatar);
      String? newBackgroundUrl = sp.getString(key_background);
      if (newAvatarUrl?.isNotEmpty == true || newBackgroundUrl?.isNotEmpty == true) {
        avatarUrl.value = newAvatarUrl ?? avatarUrl.value;
        backgroundUrl.value = newBackgroundUrl ?? backgroundUrl.value;
      }
    });
  }

  Future<void> onTapBackground() async {
    ChannelUtil.hideBottomBar(true);
    var fileUrl = await router.push(name: MCRouter.photo_picker, arguments: {MCRouter.key_url: backgroundUrl.value});
    if (fileUrl is String) {
      backgroundUrl.value = fileUrl;
      SharedPreferences.getInstance().then((sp) {
        sp.setString(key_background, fileUrl);
      });
    }
  }

  Future<void> onTapAvatar() async {
    ChannelUtil.hideBottomBar(true);
    var fileUrl = await router.push(name: MCRouter.photo_picker, arguments: {MCRouter.key_url: avatarUrl.value});
    if (fileUrl is String) {
      avatarUrl.value = fileUrl;

      SharedPreferences.getInstance().then((sp) {
        sp.setString(key_avatar, fileUrl);
      });
    }
  }
}
