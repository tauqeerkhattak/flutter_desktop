import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/effects_controller.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/screens/log/log_list.dart';
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

class Effect extends StatefulWidget {
  const Effect({Key? key}) : super(key: key);

  @override
  State<Effect> createState() => _EffectState();
}

class _EffectState extends State<Effect> with TickerProviderStateMixin {
  final controller = Get.put(EffectsController());
  bool hasScrolled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultLayout(
        title: controller.receiver.text!.toUpperCase(),
        buttonText: controller.receiver.button!.mainButton!.text,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TopBar(
                    icon: controller.receiver.icon,
                    receiverName: controller.receiver.name?.toUpperCase(),
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
                                  Get.to(() => const LogList());
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
                    isMusic: false,
                    height:
                        controller.isSheetOpen.value ? Get.height * 0.64 : 0,
                    items: controller.receiver.statusMenuItems,
                    context: context,
                    bottomText: 'Playing "5" Effect',
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
          iconAsset: 'assets/icons/up_arrow.png',
          isSheetOpen: controller.isSheetOpen.value,
          onTap: () {
            controller.isSheetOpen.toggle();
          },
        ),
      ),
    );
  }
}
