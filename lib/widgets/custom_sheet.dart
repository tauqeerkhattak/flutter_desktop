import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'custom_animation.dart';

class CustomSheet {
  final controller = Get.find();
  static void showBottomSheet({
    required BuildContext context,
    required controller,
    required String title,
    required IconData titleIcon,
    required String buttonText,
    required String subtitle,
    required int subtitleIconsLength,
    required String bottomText,
    required bool isMusic,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: SizeConfig.screenHeight,
          color: Colors.black,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            titleIcon,
                            color: Constants.primaryTextColor,
                            size: Constants.iconSize2,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: TitleText(
                            text: title,
                            textColor: Constants.primaryColor,
                            weight: FontWeight.bold,
                            fontSize: Constants.headingSize1,
                          ),
                        ),
                        const Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        color: Constants.backgroundColor,
                        border: Border.all(
                          color: Constants.primaryTextColor,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: TitleText(
                                text: subtitle,
                                fontSize: Constants.headingSize,
                                textColor: Constants.primaryTextColor,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:
                                    List.generate(subtitleIconsLength, (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: ImageIcon(
                                      AssetImage(
                                        Constants.icons[index],
                                      ),
                                      color: Constants.primaryTextColor,
                                      size: Constants.iconSize,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: CustomAnimation(
                      shadowSpreadRadius: 1,
                      controller: controller,
                      shadowType: ShadowType.light,
                      singleShadowWidth: 0.004,
                      child: ListView.builder(
                        itemCount: 30,
                        controller: controller.scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.08,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: TitleText(
                                      text: isMusic
                                          ? Constants.calls[
                                              index % Constants.calls.length]
                                          : Constants.names[
                                              index % Constants.names.length],
                                      fontSize: Constants.headingSize2 + 5,
                                      textColor: Constants.primaryTextColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Countdown(
                                    seconds: 10 * index,
                                    build: (BuildContext context, double time) {
                                      int minutes = time ~/ 60;
                                      int seconds = (time % 60).toInt();
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TitleText(
                                            text: minutes.toString().padLeft(
                                                  2,
                                                  '0',
                                                ),
                                            fontSize: Constants.headingSize,
                                            fontFamily: 'Digital7',
                                            textColor:
                                                Constants.primaryTextColor,
                                            textAlign: TextAlign.center,
                                          ),
                                          TitleText(
                                            text:
                                                ' : ${seconds.toString().padLeft(2, '0')}',
                                            fontSize: Constants.headingSize,
                                            fontFamily: 'Digital7',
                                            textColor:
                                                Constants.primaryTextColor,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                if (!isMusic)
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(
                                        CupertinoIcons.refresh_bold,
                                        color: Constants.primaryTextColor,
                                        size: Constants.iconSize1,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                if (!isMusic)
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(
                                        CupertinoIcons.clear,
                                        color: Colors.red,
                                        size: Constants.iconSize1,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Constants.primaryTextColor,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: TitleText(
                                text: bottomText,
                                textColor: Constants.primaryTextColor,
                                fontSize: Constants.headingSize1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Constants.primaryTextColor,
                                size: Constants.iconSize2,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                    text: buttonText,
                    textColor: Constants.primaryTextColor,
                    textAlign: TextAlign.center,
                    fontSize: Constants.headingSize,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
