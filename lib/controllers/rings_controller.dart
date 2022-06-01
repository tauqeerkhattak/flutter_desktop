import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
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

class RingsController extends GetxController {
  Rx<int> selectedIndex = (-1).obs;
  RxBool isSheetOpen = false.obs;
  int itemsCount = 30;
  int itemHeight = 80;
  int itemWidth = 100;
  Rx<double> cWidth = 0.0.obs;
  final scrollController = ScrollController();
  Receiver receiver = Receiver();
  $List list = $List();
  List<ListItem>? items;

  @override
  void onInit() {
    Get.delete<BottomSheetController>();
    receiver.text = 'RINGS';
    receiver.button = MainButtonList(
      receiver: receiver,
      mainButton: MainButton(
        text: 'Call',
      ),
      disabled: false,
    );
    receiver.icon = 'assets/icons/next.png';
    receiver.name = 'SWETNESS';
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
    receiver.status = 'Finnish Shoot';
    receiver.statusMenuItems = List.generate(34, (index) {
      return StatusMenuItem(
        name: Constants.names[index % 5],
        time: Random().nextInt(3000).toDouble(),
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
