import 'package:camera/camera.dart';
import 'package:get/get.dart';

import '../../channel_util.dart';

class CameraPageController extends GetxController {
  var _cameraIndex = 0.obs;

  int get cameraIndex => _cameraIndex.value;

  set cameraIndex(int index) => _cameraIndex.value = index;

  var _flash = false.obs;

  bool get flash => _flash.value;

  set flash(bool enable) => _flash.value = enable;

  CameraController? _cameraController;
  late List<CameraDescription> cameras;
  Rx<CameraController?> _cameraControllerObs = Rx<CameraController?>(null);

  CameraController? get cameraController => _cameraControllerObs.value;

  void init() {
    availableCameras().then((value) {
      cameras = value;
      _initCameraController();
    });
  }

  void _initCameraController() {
    _cameraController = CameraController(cameras[cameraIndex], ResolutionPreset.medium);

    _cameraController?.initialize().then((_) {
      _cameraControllerObs.value = _cameraController;
    });
  }

  void onCloseTap() {
    ChannelUtil.closeCamera();
  }

  void onSwitchCamera() {
    cameraIndex = cameraIndex == 0 ? 1 : 0;
    _initCameraController();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
  }

  void takePhotoAndUpload() {
    _cameraController?.takePicture();
    print("MOOC, upload");
  }
}
