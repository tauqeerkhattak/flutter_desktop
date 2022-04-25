import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> selectedIndex = (-1).obs;
  int itemsCount = 30;
  int itemHeight = 80;
  int itemWidth = 100;
  Rx<double> cWidth = 0.0.obs;
  late AnimationController topAnimationController;
  late Animation<double> topAnimation;
  late AnimationController bottomAnimationController;
  late Animation<double> bottomAnimation;
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
