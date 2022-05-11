import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/bottom_bar.dart';
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
      backgroundColor: Colors.black.withOpacity(0.8),
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return SizedBox(
          height: SizeConfig.screenHeight * 0.78,
          width: SizeConfig.screenWidth,
          child: Stack(
            children: [
              Column(
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       border: Border.symmetric(
                  //         horizontal: BorderSide(
                  //           color: Constants.borderColor,
                  //         ),
                  //       ),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           flex: 1,
                  //           child: SizedBox(
                  //             width: 20,
                  //             height: 20,
                  //             child: Image.asset('assets/icons/tv.png'),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           flex: 6,
                  //           child: TitleText(
                  //             text: title,
                  //             textColor: Constants.primaryColor,
                  //             weight: FontWeight.bold,
                  //             fontSize: Constants.headingSize1 - 9,
                  //           ),
                  //         ),
                  //         const Expanded(
                  //           flex: 3,
                  //           child: SizedBox(),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 19,
                    child: BorderBox(
                      backgroundColor: Colors.transparent,
                      child: Column(
                        children: [
                          // Expanded(
                          //   flex: 5,
                          //   child: BorderBox(
                          //     backgroundColor: Constants.backgroundColor,
                          //     margin: 0,
                          //     horizontal: true,
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Expanded(
                          //           child: Container(
                          //             margin: const EdgeInsets.only(left: 10),
                          //             child: TitleText(
                          //               text: subtitle,
                          //               fontSize: Constants.headingSize,
                          //               textColor: Constants.primaryTextColor,
                          //               weight: FontWeight.bold,
                          //             ),
                          //           ),
                          //         ),
                          //         Expanded(
                          //           child: Container(
                          //             margin: const EdgeInsets.only(
                          //               bottom: 10,
                          //             ),
                          //             alignment: Alignment.centerLeft,
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: List.generate(
                          //                   subtitleIconsLength, (index) {
                          //                 return Container(
                          //                   margin: const EdgeInsets.only(
                          //                     left: 20,
                          //                     right: 20,
                          //                   ),
                          //                   width: 48,
                          //                   height: 48,
                          //                   child: Image.asset(
                          //                     Constants.icons[index],
                          //                     color: Constants.primaryTextColor,
                          //                   ),
                          //                 );
                          //               }),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            flex: 14,
                            child: BorderBox(
                              backgroundColor: Colors.transparent,
                              margin: 0,
                              horizontal: true,
                              child: CustomAnimation(
                                shadowSpreadRadius: 1,
                                controller: controller,
                                shadowType: ShadowType.light,
                                singleShadowWidth: 0.004,
                                child: RawScrollbar(
                                  thumbColor: Constants.scrollBarColor,
                                  thickness: 10,
                                  radius: const Radius.circular(
                                    15,
                                  ),
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(scrollbars: false),
                                    child: ListView.builder(
                                      itemCount: 30,
                                      controller: controller.scrollController,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: SizeConfig.screenWidth,
                                          height:
                                              SizeConfig.screenHeight * 0.08,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 20),
                                                  child: TitleText(
                                                    text: isMusic
                                                        ? Constants.calls[
                                                            index %
                                                                Constants.calls
                                                                    .length]
                                                        : Constants.names[
                                                            index %
                                                                Constants.names
                                                                    .length],
                                                    fontSize:
                                                        Constants.headingSize2,
                                                    textColor: Constants
                                                        .primaryTextColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Countdown(
                                                  seconds: 10 * index,
                                                  build: (BuildContext context,
                                                      double time) {
                                                    int minutes = time ~/ 60;
                                                    int seconds =
                                                        (time % 60).toInt();
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TitleText(
                                                          text: minutes
                                                              .toString()
                                                              .padLeft(
                                                                2,
                                                                '0',
                                                              ),
                                                          fontSize: Constants
                                                              .headingSize2,
                                                          fontFamily:
                                                              'Digital7',
                                                          textColor: Constants
                                                              .primaryTextColor,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        TitleText(
                                                          text:
                                                              ':${seconds.toString().padLeft(
                                                                    2,
                                                                    '0',
                                                                  )}',
                                                          fontSize: Constants
                                                              .headingSize2,
                                                          fontFamily:
                                                              'Digital7',
                                                          textColor: Constants
                                                              .primaryTextColor,
                                                          textAlign:
                                                              TextAlign.center,
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
                                                          'assets/icons/cancel.png'),
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
                        ],
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
              // Positioned(
              //   right: 20,
              //   child: Container(
              //     width: 132,
              //     height: 67,
              //     decoration: BoxDecoration(
              //       border: Border(
              //         left: BorderSide(
              //           color: Constants.primaryTextColor,
              //         ),
              //         right: BorderSide(
              //           color: Constants.primaryTextColor,
              //         ),
              //         bottom: BorderSide(
              //           color: Constants.primaryTextColor,
              //         ),
              //       ),
              //       color: Colors.black,
              //     ),
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(
              //       3,
              //     ),
              //     child: TitleText(
              //       text: buttonText,
              //       textColor: Constants.primaryTextColor,
              //       textAlign: TextAlign.center,
              //       fontSize: Constants.bottomBarText,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
