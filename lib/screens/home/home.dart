import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/screens/client/client.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
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
      backgroundColor: Colors.black,
      body: DefaultLayout(
        title: 'STEPS',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: TopBar(
                color: Constants.dark,
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
                    color: Constants.scrollBarColor,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      controller: controller.scrollController,
                      itemCount: controller.itemsCount,
                      padding: const EdgeInsets.only(top: 65),
                      itemBuilder: (BuildContext context, int index) {
                        return MouseRegion(
                          onHover: (hover) {
                            controller.selectedIndex.value = index;
                          },
                          child: SizedBox(
                            width: 94,
                            height: 137,
                            child: HomeGridItem(
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
                              name: 'Name of the Action $index',
                              icon: Constants.icons[index % 5],
                              enabled: index == 11 ? false : true,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            BottomBar(
              text: 'Finnish Shoot',
              iconAsset: 'assets/icons/up_arrow.png',
              onTap: () {
                final sheetController = Get.put(BottomSheetController());
                CustomSheet.showBottomSheet(
                  isMusic: false,
                  context: context,
                  controller: sheetController,
                  bottomText: 'Playing "5" Effect',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
