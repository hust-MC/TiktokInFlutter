import 'package:flutter/services.dart';

class ChannelUtil {
  static MethodChannel _methodChannel = MethodChannel("CommonChannel");

  static hideBottomBar(bool hide) {
    _methodChannel.invokeMethod("hideBottomBar", {"hide": hide});
  }

  static closeCamera() {
    _methodChannel.invokeMethod("closeCamera");
  }
}
