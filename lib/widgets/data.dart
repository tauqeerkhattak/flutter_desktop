import 'dart:math';

import 'package:flutter_desktop/models/clients_item.dart';
import 'package:flutter_desktop/models/effects_item.dart';
import 'package:flutter_desktop/models/json_item.dart' hide Type;
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/main_button.dart';
import 'package:flutter_desktop/models/message_status_menu_item.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';
import 'package:flutter_desktop/models/steps_item.dart';
import 'package:flutter_desktop/models/video_status_menu_item.dart';
import 'package:flutter_desktop/utils/constants.dart';

class Data {
  static $List list = $List(
    name: 'The List',
    text: 'List',
    icon: 'assets/icons/tv.png',
  );

  Receiver glsr = Receiver(
    name: 'glsr',
    status: 'glsr_Receiver',
    icon: 'assets/icons/bin.png',
  );

  Receiver mR = Receiver(
    name: 'mR',
    status: 'm Receiver',
    icon: 'assets/icons/camcorder.png',
  );

  MainButton mR_mB = MainButton(text: 'mR Button');

  VideoStatusMenuItem mr_vsi = VideoStatusMenuItem(
    id: 123,
    name: 'mr_vsi',
    time: 150012,
    timer_down: false,
  );
  VideoStatusMenuItem mr_vsi2 = VideoStatusMenuItem(
    id: 124,
    name: 'mr_vsi2',
    time: 1523412,
    timer_down: true,
  );
  MessageStatusMenuItem mr_msi = MessageStatusMenuItem(
    id: 125,
    name: 'mr_msi',
    time: 150012512,
    timer_down: false,
  );

  static ClientItem ci1 = ClientItem(
    name: 'ci1',
    text: 'Item Kill',
    icon: 'assets/icons/aim.png',
  );
  static EffectsItem ci2 = EffectsItem(
    name: 'ci2',
    text: 'Item hector',
    icon: 'assets/icons/aim.png',
  );
  static StepsItem ci3 = StepsItem(
    name: 'ci3',
    text: 'Item video',
    icon: null,
  );
  static StepsItem ci4 = StepsItem(
    name: 'ci4',
    text: 'Item photo',
    icon: null,
  );

  static void initialize() {
    List<JSONItem> temp = [ci1, ci2, ci3, ci4];
    list.forAllItemsList = List.generate(temp.length, (index) {
      return ListItem(
        item: temp[index],
        disable: (index % getRandom()) == 0,
      );
    });
    list.add(ci4);
    list.generalStatus = 'Finnish Shoot';
    list.generalStatusMenuItems = List.generate(20, (index) {
      return StatusMenuItem(
        timerDown: index % 5 == 0,
        id: index,
        name: Constants.names[index % 5],
        time: index * 100,
        type: index % 4 == 0 ? Type.video : Type.message,
      );
    });
  }

  static int getRandom() {
    int i = Random().nextInt(4);
    if (i == 0) {
      return getRandom();
    } else {
      return i;
    }
  }
}
