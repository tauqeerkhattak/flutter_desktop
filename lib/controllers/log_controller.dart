import 'package:flutter/material.dart';
import 'package:flutter_desktop/widgets/log_item.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class LogController extends GetxController {
  Rx<double> cWidth = 0.0.obs;
  final scrollController = ScrollController();
  Color logColor = Colors.white;
  List<LogItem> logs = Constants.names.map(
    (e) {
      return LogItem(
        asset: Constants.icons[Constants.names.indexOf(e) % 6],
        onVisibilityChanged: (info) {},
        name: e,
        timeColor:
            Constants.names.indexOf(e) % 4 == 0 ? Colors.red : Colors.white,
        time: '12:0${Constants.names.indexOf(e)}',
        logKey: Key('$e${e.length}'),
      );
    },
  ).toList();

  @override
  void onInit() {
    Constants.setWindow(width: 0.25, height: 0.315);
    logs.sort((a, b) {
      List<String> aList = a.time.split(':');
      List<String> bList = b.time.split(':');
      if (int.parse(aList[0]).compareTo(int.parse(bList[0])) == 0) {
        return int.parse(bList[1]).compareTo(int.parse(aList[1]));
      } else {
        return int.parse(bList[0]).compareTo(int.parse(aList[0]));
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    Constants.setWindow(width: 0.25, height: 0.65);
    scrollController.dispose();
    super.onClose();
  }
}
