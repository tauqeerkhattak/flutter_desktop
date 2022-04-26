import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/screens/client/client.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/grid_item.dart';
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
  void initState() {
    controller.topAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    controller.topAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller.topAnimationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    controller.topAnimationController.forward();
    controller.topAnimationController.reverse();
    controller.bottomAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    controller.bottomAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller.bottomAnimationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    super.initState();
  }

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
              margin: const EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              child: TitleText(
                text: 'STEPS',
                fontSize: 24,
                weight: FontWeight.bold,
                textColor: Constants.primaryTextColor,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Stack(
              children: [
                NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    if (!hasScrolled) {
                      setState(() {
                        hasScrolled = true;
                      });
                    }
                    log("Notification ${notification.direction}");
                    controller.cWidth.value = controller
                            .scrollController.offset /
                        controller.scrollController.position.maxScrollExtent;
                    if (controller.cWidth < 0.025) {
                      controller.topAnimationController.forward();
                    } else if (controller.cWidth >= 0.02) {
                      controller.topAnimationController.reverse();
                    }
                    if (controller.cWidth > 0.975) {
                      controller.bottomAnimationController.forward();
                    } else if (controller.cWidth <= 0.975) {
                      controller.bottomAnimationController.reverse();
                    }
                    return true;
                  },
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
                        () => GridItem(
                          onDoubleTap: () {
                            controller.selectedIndex.value = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const Client();
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
                !hasScrolled
                    ? const SizedBox()
                    : Positioned(
                        top: -8,
                        child: SizedBox(
                          width: SizeConfig.screenWidth,
                          child: FadeTransition(
                            opacity: controller.topAnimation,
                            child: CustomShadow(
                              direction: VerticalDirection.down,
                            ),
                          ),
                        ),
                      ),
                Positioned(
                  bottom: 14,
                  child: SizedBox(
                    width: SizeConfig.screenWidth,
                    child: FadeTransition(
                      opacity: controller.bottomAnimation,
                      child: CustomShadow(
                        direction: VerticalDirection.up,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
