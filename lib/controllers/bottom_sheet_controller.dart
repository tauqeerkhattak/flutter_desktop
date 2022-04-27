import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  Rx<double> cWidth = 0.0.obs;
  int itemsCount = 30;
  int itemHeight = 80;
  int itemWidth = 100;
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
