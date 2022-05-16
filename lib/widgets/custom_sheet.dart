import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/bottom_bar.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
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
    required String bottomText,
    required bool isMusic,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black.withOpacity(0.9),
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return SizedBox(
          height: SizeConfig.screenHeight * 0.75,
          // height: 366,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              Expanded(
                child: BorderBox(
                  backgroundColor: Colors.transparent,
                  child: BorderBox(
                    backgroundColor: Colors.transparent,
                    margin: 0,
                    horizontal: true,
                    child: CustomAnimation(
                      controller: controller,
                      shadowType: ShadowType.light,
                      child: CustomScrollBar(
                        color: Constants.scrollBarColor,
                        child: ListView.builder(
                          itemCount: 30,
                          controller: controller.scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.screenHeight * 0.08,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TitleText(
                                      text: isMusic
                                          ? Constants.calls[
                                              index % Constants.calls.length]
                                          : Constants.names[
                                              index % Constants.names.length],
                                      fontSize: Constants.headingSize2,
                                      textColor: Constants.primaryTextColor,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Countdown(
                                      seconds: 10 * index,
                                      build:
                                          (BuildContext context, double time) {
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
                                              weight: FontWeight.bold,
                                              fontSize: Constants.headingSize2,
                                              fontFamily: 'Digital7',
                                              textColor:
                                                  Constants.primaryTextColor,
                                              textAlign: TextAlign.center,
                                            ),
                                            TitleText(
                                              text:
                                                  ':${seconds.toString().padLeft(
                                                        2,
                                                        '0',
                                                      )}',
                                              weight: FontWeight.bold,
                                              fontSize: Constants.headingSize2,
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
                                      child: InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: 21,
                                          height: 24,
                                          child: Image.asset(
                                            index % 5 != 0
                                                ? 'assets/icons/reload.png'
                                                : 'assets/icons/next.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (!isMusic)
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: 21,
                                          height: 24,
                                          child: Image.asset(
                                            'assets/icons/cancel.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              BottomBar(
                text: bottomText,
                iconAsset: 'assets/icons/down_arrow.png',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
