import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/message_status_ui.dart';
import 'package:flutter_desktop/widgets/video_status_item.dart';
import 'package:get/get.dart';

import 'custom_animation.dart';

class CustomBottomSheet extends StatelessWidget {
  final BuildContext context;
  final BottomSheetController sheetController;
  final List<StatusMenuItem>? items;
  final String bottomText;
  final bool isMusic;
  final double height;

  const CustomBottomSheet({
    Key? key,
    required this.context,
    this.items,
    required this.bottomText,
    required this.isMusic,
    required this.height,
    required this.sheetController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.black.withOpacity(0.4),
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      height: height,
      width: Get.width,
      child: BorderBox(
        backgroundColor: Colors.black.withOpacity(0.9),
        child: CustomAnimation(
          controller: sheetController,
          shadowType: ShadowType.light,
          child: CustomScrollBar(
            controller: sheetController.scrollController,
            color: Constants.scrollBarColor,
            child: ListView.builder(
              itemCount: items == null ? 30 : items!.length,
              controller: sheetController.scrollController,
              itemBuilder: (BuildContext context, int index) {
                if (items == null) {
                  return VideoStatusUI(
                    text: Constants.names[index % 5],
                    timerDown: index % 3 == 0,
                    time: index * 10,
                  );
                } else {
                  if (items![index].type == Type.video) {
                    return VideoStatusUI(
                      text: items![index].name!,
                      timerDown: items![index].timerDown!,
                      time: items![index].time!,
                    );
                  } else {
                    return MessageStatusUI(
                      text: items![index].name!,
                      timerDown: items![index].timerDown!,
                      time: items![index].time!,
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
