import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/log_controller.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/custom_animation.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/default_layout.dart';
import 'package:get/get.dart';

import '../../widgets/border_box.dart';

class LogList extends StatefulWidget {
  LogList({Key? key}) : super(key: key);

  @override
  State<LogList> createState() => _LogListState();
}

class _LogListState extends State<LogList> {
  final controller = Get.put(LogController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        appWindow.startDragging();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: DefaultLayout(
          marginTop: 10,
          title: 'Log',
          child: CustomAnimation(
            shadowHeight: 70,
            controller: controller,
            shadowType: ShadowType.dark,
            child: CustomScrollBar(
              controller: controller.scrollController,
              leftMargin: 9,
              color: Constants.scrollBarColor,
              child: BorderBox(
                left: 5,
                backgroundColor: Constants.backgroundColor,
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  controller: controller.scrollController,
                  children: controller.logs,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
