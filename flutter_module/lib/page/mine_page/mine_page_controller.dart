import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

// GetX改造步骤2：创建controller，继承自GetXController
class MinePageController extends GetxController {
  // GetX改造步骤3：给变量值添加.obs
  var _backgroundUrl = Assets.image.defaultPhoto.path.obs;

  String get backgroundUrl => _backgroundUrl.value;

  set backgroundUrl(String url) => _backgroundUrl.value = url;
}
