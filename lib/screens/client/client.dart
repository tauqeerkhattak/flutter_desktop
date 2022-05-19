import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/client_controller.dart';
import 'package:flutter_desktop/screens/effects/effects.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
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
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: DefaultLayout(
          title: 'Client'.toUpperCase(),
          buttonText: 'Send Message',
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: TopBar(
                  icon: 'assets/icons/linux.png',
                  receiverName: 'DOOM GAVE',
                ),
              ),
              Expanded(
                flex: 19,
                child: BorderBox(
                  backgroundColor: Constants.backgroundColor,
                  child: CustomAnimation(
                    controller: controller,
                    shadowType: ShadowType.dark,
                    child: CustomScrollBar(
                      color: Colors.black,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio:
                              controller.itemHeight / controller.itemWidth,
                        ),
                        itemCount: controller.itemsCount,
                        controller: controller.scrollController,
                        padding: const EdgeInsets.only(top: 65),
                        itemBuilder: (BuildContext context, int index) {
                          return MouseRegion(
                            onHover: (hover) {
                              controller.selectedIndex.value = index;
                            },
                            child: ClientGridItem(
                              showBadge: index % 5 == 0,
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
                              name: 'Name of the media $index',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              BottomBar(
                text: 'Playing video...',
                iconAsset: 'assets/icons/up_arrow.png',
                onTap: () {
                  final sheetController = Get.put(BottomSheetController());
                  CustomSheet.showBottomSheet(
                    isMusic: true,
                    context: context,
                    controller: sheetController,
                    bottomText: 'Ringing... 3/8',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
