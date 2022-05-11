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
          title: 'Client',
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
                    singleShadowWidth: 0.009,
                    shadowSpreadRadius: 4,
                    controller: controller,
                    shadowType: ShadowType.dark,
                    child: RawScrollbar(
                      thumbColor: Colors.black,
                      thickness: 10,
                      radius: const Radius.circular(
                        15,
                      ),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:
                                controller.itemHeight / controller.itemWidth,
                          ),
                          itemCount: controller.itemsCount,
                          controller: controller.scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return ClientGridItem(
                              showBadge: index % 5 == 0,
                              onDoubleTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Effect();
                                    },
                                  ),
                                );
                              },
                              name: 'Name of the media $index',
                            );
                          },
                        ),
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
                      buttonText: 'Call',
                      title: 'SWETNESS',
                      titleIcon: Icons.tv,
                      subtitle: 'RINGS',
                      subtitleIconsLength: 1,
                      bottomText: 'Ringing... 3/8',
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
