import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:window_size/window_size.dart';

class ListSwitchController extends GetxController {
  int currentIndex = 0;
  Rx<double> cWidth = 0.0.obs;
  final scrollController = AutoScrollController(
    axis: Axis.horizontal,
  );
  RxDouble width = 0.0.obs;
  RxDouble height = 0.0.obs;
  List<String> receivers = [
    'DOOM GAVE',
    'SWETNESS',
    'ABCDEFG',
    'STARTUP',
    'BELONGS HERE',
    'LOREM IPSUM',
  ];

  @override
  void onInit() {
    Constants.setWindow(width: 0.7, height: 0.315);
    getSize();
    super.onInit();
  }

  Future<void> getSize() async {
    final Screen? size = await getCurrentScreen();
    width.value = size!.frame.width * 0.7;
    height.value = size.frame.height * 0.305;
    log('Width: $width');
  }

  @override
  void onClose() {
    Constants.setWindow(width: 1, height: 0.095);
    super.onClose();
  }
}
