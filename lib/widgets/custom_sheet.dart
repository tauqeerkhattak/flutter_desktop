import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/bottom_bar.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          height: Get.height * 0.75,
          // height: 366,
          width: Get.width,
          child: Column(
            children: [
              Expanded(
                child: BorderBox(
                  backgroundColor: Colors.transparent,
                  child: BorderBox(
                    backgroundColor: Colors.transparent,
                    left: 2.5,
                    right: 2.5,
                    child: CustomAnimation(
                      controller: controller,
                      shadowType: ShadowType.light,
                      child: CustomScrollBar(
                        controller: controller.scrollController,
                        color: Constants.scrollBarColor,
                        child: ListView.builder(
                          itemCount: 30,
                          controller: controller.scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              width: Get.width,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        left: 30,
                                        right: 4,
                                      ),
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
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        left: 4,
                                        right: 5,
                                      ),
                                      child: Countdown(
                                        seconds: 10 * index,
                                        build: (BuildContext context,
                                            double time) {
                                          int minutes = time ~/ 60;
                                          int seconds = (time % 60).toInt();
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TitleText(
                                                text:
                                                    minutes.toString().padLeft(
                                                          2,
                                                          '0',
                                                        ),
                                                fontSize:
                                                    Constants.headingSize2,
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
                                                fontSize:
                                                    Constants.headingSize2,
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
                                  ),
                                  if (!isMusic)
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          left: 5,
                                          right: 8,
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 21,
                                            height: 24,
                                            child: index % 5 != 0
                                                ? Image.asset(
                                                    'assets/icons/next.png',
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/svg/re-loop.svg',
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (!isMusic)
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 8,
                                        right: 28,
                                      ),
                                      child: InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: 21,
                                          height: 24,
                                          child: SvgPicture.asset(
                                            'assets/svg/cancel.svg',
                                          ),
                                        ),
                                      ),
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
