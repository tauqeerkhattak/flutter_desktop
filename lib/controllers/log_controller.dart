import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../utils/constants.dart';

class LogController extends GetxController {
  Rx<int> selectedIndex = (-1).obs;
  int itemsCount = 30;
  int itemHeight = 80;
  int itemWidth = 100;
  String? mainButton;
  String status = 'Finnish Shoot';
  Rx<double> cWidth = 0.0.obs;
  int counter = 120;
  final scrollController = ScrollController();
  final timer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    onChange: (value) {},
  );

  @override
  void onInit() {
    Constants.setWindow(width: 0.25, height: 0.305);
    super.onInit();
  }

  @override
  void onClose() {
    Constants.setWindow(width: 0.25, height: 0.65);
    scrollController.dispose();
    super.onClose();
  }
}
