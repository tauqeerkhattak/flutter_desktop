import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/screens/client/client.dart';
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

import '../../widgets/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultLayout(
        title: Data.list.name!,
        buttonText: controller.mainButton,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TopBar(
                    receiverName: 'GENERAL',
                    icon: 'assets/icons/tv.png',
                    color: Constants.dark,
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
                      shadowHeight: 100,
                      child: CustomScrollBar(
                        controller: controller.scrollController,
                        color: Constants.scrollBarColor,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          controller: controller.scrollController,
                          itemCount: Data.list.forAllItemsList!.length,
                          padding: const EdgeInsets.only(top: 65),
                          itemBuilder: (BuildContext context, int index) {
                            ListItem listItem =
                                Data.list.forAllItemsList![index];
                            return MouseRegion(
                              onHover: (hover) {
                                controller.selectedIndex.value = index;
                              },
                              child: SizedBox(
                                width: 94,
                                height: 137,
                                child: HomeGridItem(
                                  onDoubleTap: () {
                                    Get.to(
                                      () => Client(),
                                    );
                                    listItem.onDoubleClick();
                                  },
                                  name: listItem.item!.name!,
                                  icon: listItem.item!.icon ?? Data.list.icon!,
                                  enabled: !listItem.disable!,
                                ),
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
                    height:
                        controller.isSheetOpen.value ? Get.height * 0.64 : 0,
                    context: context,
                    items: Data.list.generalStatusMenuItems,
                    bottomText: controller.status,
                    isMusic: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomBar(
          text: Data.list.generalStatus!,
          iconAsset: 'assets/icons/up_arrow.png',
          isSheetOpen: controller.isSheetOpen.value,
          onTap: () {
            log('Finnish Shoot tapped');
            controller.isSheetOpen.toggle();
          },
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
