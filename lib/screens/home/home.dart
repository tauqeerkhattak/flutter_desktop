import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final controller = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = index;
                    },
                    child: Container(
                      height: SizeConfig.screenHeight * 0.4,
                      margin: const EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        border: controller.selectedIndex.value == index
                            ? Border.all(
                                color: Constants.primaryTextColor,
                                width: 1,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            FluentIcons.clock,
                          ),
                          TitleText(
                            text: 'Step $index',
                            fontSize: 20,
                            textColor: Constants.primaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
