import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/rings_controller.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/bottom_bar.dart';
import 'package:flutter_desktop/widgets/custom_animation.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/custom_sheet.dart';
import 'package:flutter_desktop/widgets/default_layout.dart';
import 'package:flutter_desktop/widgets/home_grid_item.dart';
import 'package:flutter_desktop/widgets/top_bar.dart';
import 'package:get/get.dart';

class Rings extends StatefulWidget {
  const Rings({Key? key}) : super(key: key);

  @override
  State<Rings> createState() => _RingsState();
}

class _RingsState extends State<Rings> with TickerProviderStateMixin {
  final controller = Get.put(RingsController());
  bool hasScrolled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultLayout(
        title: controller.receiver.text!,
        buttonText: controller.receiver.button!.mainButton!.text,
        onTap: () {
          controller.receiver.button!.onClick();
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TopBar(
                    icon: controller.receiver.icon!,
                    receiverName: controller.receiver.name!,
                  ),
                ),
                Expanded(
                  flex: 19,
                  child: BorderBox(
                    left: 2.5,
                    right: 2.5,
                    backgroundColor: Constants.backgroundColor,
                    child: CustomAnimation(
                      controller: controller,
                      shadowType: ShadowType.dark,
                      child: CustomScrollBar(
                        controller: controller.scrollController,
                        color: Constants.scrollBarColor,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:
                                controller.itemHeight / controller.itemWidth,
                          ),
                          controller: controller.scrollController,
                          itemCount: controller.items!.length,
                          padding: const EdgeInsets.only(top: 65),
                          itemBuilder: (BuildContext context, int index) {
                            ListItem listItem = controller.items![index];
                            return MouseRegion(
                              onHover: (hover) {
                                controller.selectedIndex.value = index;
                              },
                              child: HomeGridItem(
                                onDoubleTap: () {
                                  log('Item # $index');
                                  listItem.onDoubleClick();
                                },
                                name: listItem.item!.text!,
                                icon: listItem.item!.icon!,
                                enabled: !listItem.disable!,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 2.5,
              right: 2.5,
              child: Obx(
                () {
                  final sheetController = Get.put(BottomSheetController());
                  return CustomBottomSheet(
                    sheetController: sheetController,
                    items: controller.receiver.statusMenuItems,
                    isMusic: false,
                    context: context,
                    height:
                        controller.isSheetOpen.value ? Get.height * 0.64 : 0,
                    bottomText: 'Ringing... 3/8',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomBar(
          text: controller.receiver.status!,
          isSheetOpen: controller.isSheetOpen.value,
          iconAsset: 'assets/icons/up_arrow.png',
          onTap: () {
            controller.isSheetOpen.toggle();
          },
        ),
      ),
    );
  }
}
