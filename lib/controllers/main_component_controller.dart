import 'package:flutter_desktop/utils/constants.dart';
import 'package:get/get.dart';
import 'package:window_size/window_size.dart';

class MainComponentController extends GetxController {
  RxDouble width = 0.0.obs;
  RxString mainButton = 'START'.obs;

  @override
  void onInit() {
    Constants.setWindow(width: 1, height: 0.095);
    getSize();
    super.onInit();
  }

  Future<void> getSize() async {
    final Screen? size = await getCurrentScreen();
    width.value = size!.frame.width;
  }

  @override
  void onClose() {
    Constants.setWindow(width: 0.25, height: 0.27);
    super.onClose();
  }
}
