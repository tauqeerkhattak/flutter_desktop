import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/screens/client/client.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/bottom_bar.dart';
import 'package:flutter_desktop/widgets/custom_animation.dart';
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
              flex: 17,
              child: BorderBox(
                backgroundColor: Constants.backgroundColor,
                child: CustomAnimation(
                  shadowSpreadRadius: 4,
                  singleShadowWidth: 0.009,
                  controller: controller,
                  shadowType: ShadowType.dark,
                  child: RawScrollbar(
                    thumbColor: Constants.scrollBarColor,
                    thickness: 8,
                    radius: const Radius.circular(
                      15,
                    ),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio:
                              controller.itemHeight / controller.itemWidth,
                        ),
                        controller: controller.scrollController,
                        itemCount: controller.itemsCount,
                        itemBuilder: (BuildContext context, int index) {
                          return HomeGridItem(
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
                            icon: Constants.icons[index % 4],
                            enabled: index == 11 ? false : true,
                          );
                        },
                      ),
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
                  buttonText: 'Clear All',
                  title: 'THE SERVER',
                  titleIcon: Icons.tv,
                  subtitle: 'EFFECTS',
                  subtitleIconsLength: 3,
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
