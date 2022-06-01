import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

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
  final timer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    onChange: (value) {},
  );
  $List list = $List();
  bool hasScrolled = false;

  @override
  void onInit() {
    list.text = 'STEPS';
    list.generalStatus = 'Finnish Shoot';
    list.forAllItemsList = List.generate(20, (index) {
      return ListItem(
        owner: list,
        receiver: Receiver(
          name: 'Name of the Action # $index',
        ),
        disable: index % 5 == 0 ? true : false,
        item: JSONItem(
          text: 'Name of the Action # $index',
          icon: Constants.icons[index % 6],
        ),
      );
    });
    list.generalStatusMenuItems = List.generate(23, (index) {
      return StatusMenuItem(
        name: Constants.names[index % 5],
        time: 1200,
      );
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
