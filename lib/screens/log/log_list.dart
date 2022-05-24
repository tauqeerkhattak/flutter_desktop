import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/log_controller.dart';
import 'package:flutter_desktop/screens/main%20component/main_component.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/custom_animation.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/default_layout.dart';
import 'package:flutter_desktop/widgets/log_item.dart';
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
              leftMargin: 9,
              color: Constants.scrollBarColor,
              child: BorderBox(
                left: 5,
                backgroundColor: Constants.backgroundColor,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  itemCount: 30,
                  controller: controller.scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => MainComponentUI()),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //       return MainComponent();
                      //     }),
                      //   );
                      // },
                      child: LogItem(
                        time: '12:04',
                        name: index == 2
                            ? 'Stop now with LOve  GLSStop now with LOve  GLS... Stop now with LOve  GLSStop now with LOve  GLS...'
                            : Constants.names[index % 5],
                        asset: Constants.icons[index % 6],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
