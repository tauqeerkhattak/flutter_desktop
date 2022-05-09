import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/client_controller.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/client_grid_item.dart';
import 'package:flutter_desktop/widgets/custom_animation.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/custom_sheet.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:get/get.dart';

class Client extends StatelessWidget {
  final controller = Get.put(ClientController());
  Client({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: Constants.backgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border(
                        bottom: BorderSide(
                          color: Constants.primaryTextColor,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 2.5,
                      bottom: 2.5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        ImageIcon(
                          const AssetImage(
                            'assets/icons/linux.png',
                          ),
                          size: Constants.iconSize2,
                          color: Constants.primaryTextColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TitleText(
                          text: 'DOOM GAVE',
                          fontSize: Constants.headingSize1,
                          weight: FontWeight.bold,
                          textColor: Constants.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 19,
                  child: CustomAnimation(
                    singleShadowWidth: 0.009,
                    shadowSpreadRadius: 4,
                    controller: controller,
                    shadowType: ShadowType.dark,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio:
                            controller.itemHeight / controller.itemWidth,
                      ),
                      itemCount: controller.itemsCount,
                      controller: controller.scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(
                          () => ClientGridItem(
                            onHover: (event) {
                              controller.selectedIndex.value = index;
                            },
                            onDoubleTap: () {
                              controller.selectedIndex.value = index;
                            },
                            border: controller.selectedIndex.value == index
                                ? Border.all(
                                    color: Constants.primaryColor,
                                  )
                                : const Border.symmetric(),
                            name: 'Name of the media $index',
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border(
                        top: BorderSide(
                          color: Constants.primaryTextColor,
                        ),
                      ),
                    ),
                    child: InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: TitleText(
                                text: 'Finnish Shoot',
                                fontSize: Constants.headingSize1,
                                textAlign: TextAlign.left,
                                textColor: Constants.primaryTextColor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: Constants.primaryTextColor,
                                size: Constants.iconSize2,
                              ),
                              onPressed: () {
                                final sheetController =
                                    Get.put(BottomSheetController());
                                CustomSheet.showBottomSheet(
                                  isMusic: true,
                                  context: context,
                                  controller: sheetController,
                                  buttonText: 'Call',
                                  title: 'SWETNESS',
                                  titleIcon: Icons.tv,
                                  subtitle: 'RINGS',
                                  subtitleIconsLength: 1,
                                  bottomText: 'Ringing... 3/8',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 10,
              top: SizeConfig.screenHeight * 0.05,
              child: Row(
                children: [
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.arrow_back,
                  //     color: Constants.primaryTextColor,
                  //     size: Constants.iconSize2,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  TitleText(
                    text: 'CLIENT',
                    fontSize: Constants.headingSize1,
                    weight: FontWeight.bold,
                    textColor: Constants.primaryTextColor,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              child: Container(
                width: SizeConfig.screenWidth * 0.4,
                height: Constants.mainButtonSize,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Constants.primaryTextColor,
                    ),
                    right: BorderSide(
                      color: Constants.primaryTextColor,
                    ),
                    bottom: BorderSide(
                      color: Constants.primaryTextColor,
                    ),
                  ),
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(
                  3,
                ),
                child: TitleText(
                  text: 'Send Message',
                  textColor: Constants.primaryTextColor,
                  textAlign: TextAlign.center,
                  fontSize: Constants.headingSize1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
