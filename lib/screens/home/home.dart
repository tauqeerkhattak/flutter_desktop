import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/screens/client/client.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/custom_animation.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/custom_sheet.dart';
import 'package:flutter_desktop/widgets/home_grid_item.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final controller = Get.put(HomeController());
  bool hasScrolled = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Constants.dark,
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: const EdgeInsets.only(
                  right: 30,
                ),
                icon: Icon(
                  Icons.close,
                  color: Constants.dark,
                  size: Constants.iconSize2,
                ),
                onPressed: () {
                  appWindow.close();
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              child: TitleText(
                text: 'STEPS',
                fontSize: Constants.headingSize,
                weight: FontWeight.bold,
                textAlign: TextAlign.left,
                textColor: Constants.primaryTextColor,
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Stack(
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  child: CustomAnimation(
                    shadowSpreadRadius: 4,
                    singleShadowWidth: 0.009,
                    controller: controller,
                    shadowType: ShadowType.dark,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio:
                            controller.itemHeight / controller.itemWidth,
                      ),
                      controller: controller.scrollController,
                      itemCount: controller.itemsCount,
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(
                          () => HomeGridItem(
                            onDoubleTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Client();
                                  },
                                ),
                              );
                            },
                            onHover: (PointerHoverEvent event) {
                              controller.selectedIndex.value = index;
                            },
                            border: controller.selectedIndex.value == index
                                ? Border.all(
                                    color: Constants.primaryColor,
                                  )
                                : const Border.symmetric(),
                            name: 'Name of the Action $index',
                            icon: Constants.icons[index % 4],
                            enabled: index == 11 ? false : true,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
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
                          fontSize: Constants.headingSize - 1,
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
                          Icons.keyboard_arrow_up,
                          color: Constants.primaryTextColor,
                          size: Constants.iconSize1,
                        ),
                        onPressed: () {
                          final sheetController =
                              Get.put(BottomSheetController());
                          CustomSheet.showBottomSheet(
                            isMusic: false,
                            context: context,
                            controller: sheetController,
                            buttonText: 'Clear All',
                            title: 'THE SERVER',
                            titleIcon: Icons.tv,
                            subtitle: 'EFFECTS',
                            subtitleIconsLength: 3,
                            bottomText: 'Playing "5" Effect',
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
    );
  }
}
