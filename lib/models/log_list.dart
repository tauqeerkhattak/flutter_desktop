import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/log_controller.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/log_item.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LogList {
  final String defaultIcon;
  final controller = Get.find<LogController>();

  LogList({required this.defaultIcon});

  void log({
    Receiver? receiver,
    required String text,
    required int time,
    required bool isRealTime,
  }) {
    final keyString = '$text${text.length}';
    bool shownRed = false;
    final key = Key(keyString);
    final Duration duration = Duration(milliseconds: time);
    controller.logs.add(
      LogItem(
        logKey: key,
        name: text,
        timeColor: isRealTime ? Colors.red : null,
        time: '${duration.inMinutes}:${duration.inSeconds ~/ 60}',
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction < 1) {
            if (!shownRed) {
              controller.logColor = Colors.red;
              shownRed = true;
            }
          } else {
            controller.logColor = Constants.primaryTextColor;
          }
        },
        asset: receiver == null ? defaultIcon : receiver.icon!,
      ),
    );
  }
}
