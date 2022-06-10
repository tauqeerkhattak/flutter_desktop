import 'package:flutter_desktop/utils/constants.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:window_size/window_size.dart';

enum CountStatus { started, stopped, paused, completed }

class MainComponentController extends GetxController {
  RxDouble width = 0.0.obs;
  RxString mainButton = 'START'.obs;
  RxnInt countDownTime = RxnInt();
  CountStatus countStatus = CountStatus.started;
  final CountdownController countdownController =
      CountdownController(autoStart: true);

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
