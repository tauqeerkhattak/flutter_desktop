import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/main_button.dart';
import 'package:flutter_desktop/models/main_button_list.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:get/get.dart';

class EffectsController extends GetxController {
  Rx<int> selectedIndex = (-1).obs;
  RxBool isSheetOpen = false.obs;
  int itemsCount = 30;
  int itemHeight = 80;
  int itemWidth = 100;
  Rx<double> cWidth = 0.0.obs;
  final scrollController = ScrollController();
  Receiver receiver = Receiver();
  List<ListItem>? items;

  @override
  void onInit() {
    Get.delete<BottomSheetController>();
    receiver.name = 'The Server';
    receiver.text = 'Effects';
    receiver.icon = 'assets/icons/next.png';
    receiver.button = MainButtonList(
      mainButton: MainButton(
        text: 'Clear All',
      ),
      receiver: receiver,
      disabled: false,
    );
    $List list = $List();
    // items = list.receiverListItems?[receiver];
    items ??= List.generate(20, (index) {
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
    receiver.status = 'Playing “5” Effects';
    receiver.statusMenuItems = List.generate(23, (index) {
      return StatusMenuItem(
        name: Constants.names[index % 5],
        time: Random().nextInt(5000),
      );
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
