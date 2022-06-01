import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/client_controller.dart';
import 'package:flutter_desktop/screens/effects/effects.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/bottom_bar.dart';
import 'package:flutter_desktop/widgets/client_grid_item.dart';
import 'package:flutter_desktop/widgets/custom_animation.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/custom_sheet.dart';
import 'package:flutter_desktop/widgets/default_layout.dart';
import 'package:flutter_desktop/widgets/top_bar.dart';
import 'package:get/get.dart';

class Client extends StatelessWidget {
  final controller = Get.put(ClientController());
  Client({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: DefaultLayout(
          title: controller.receiver.text!.toUpperCase(),
          buttonText: controller.receiver.button!.mainButton!.text,
          onTap: () {
            controller.receiver.button!.onClick();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: TopBar(
                      icon: controller.receiver.icon,
                      receiverName: controller.receiver.name!.toUpperCase(),
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
                          color: Colors.black,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio:
                                  controller.itemHeight / controller.itemWidth,
                            ),
                            itemCount: controller.items!.length,
                            controller: controller.scrollController,
                            padding: const EdgeInsets.only(top: 65),
                            itemBuilder: (BuildContext context, int index) {
                              return MouseRegion(
                                onHover: (hover) {
                                  controller.selectedIndex.value = index;
                                },
                                child: ClientGridItem(
                                  showBadge: index % 5 == 0,
                                  index: index,
                                  onDoubleTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const Effect();
                                        },
                                      ),
                                    );
                                  },
                                  name: controller.items![index].item!.text!,
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
                      isMusic: true,
                      height:
                          controller.isSheetOpen.value ? Get.height * 0.64 : 0,
                      context: context,
                      bottomText: 'Ringing... 3/8',
                    );
                  },
                ),
              ),
            ],
          ),
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
