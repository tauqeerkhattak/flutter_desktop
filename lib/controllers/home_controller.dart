import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> selectedIndex = (-1).obs;
  RxBool isSheetOpen = false.obs;
  int itemsCount = 30;
  int itemHeight = 80;
  int itemWidth = 100;
  String? mainButton;
  String status = 'Finnish Shoot';
  Rx<double> cWidth = 0.0.obs;
  int counter = 120;
  final scrollController = ScrollController();
  bool hasScrolled = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
