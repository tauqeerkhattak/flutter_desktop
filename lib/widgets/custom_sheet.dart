import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/bottom_sheet_controller.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'custom_animation.dart';

class CustomBottomSheet extends StatelessWidget {
  final BuildContext context;
  final BottomSheetController sheetController;
  final List<StatusMenuItem>? items;
  final String bottomText;
  final bool isMusic;
  final double height;

  const CustomBottomSheet({
    Key? key,
    required this.context,
    this.items,
    required this.bottomText,
    required this.isMusic,
    required this.height,
    required this.sheetController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.black.withOpacity(0.4),
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      height: height,
      width: Get.width,
      child: BorderBox(
        backgroundColor: Colors.black.withOpacity(0.9),
        child: CustomAnimation(
          controller: sheetController,
          shadowType: ShadowType.light,
          child: CustomScrollBar(
            controller: sheetController.scrollController,
            color: Constants.scrollBarColor,
            child: ListView.builder(
              itemCount: items == null ? 30 : items!.length,
              controller: sheetController.scrollController,
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
                            text: items == null
                                ? isMusic
                                    ? Constants
                                        .calls[index % Constants.calls.length]
                                    : Constants
                                        .names[index % Constants.names.length]
                                : items![index].name,
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
                            seconds: items == null
                                ? (10 * index)
                                : items![index].time!.toInt(),
                            build: (BuildContext context, double time) {
                              int minutes = time ~/ 60;
                              int seconds = (time % 60).toInt();
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TitleText(
                                    text: minutes.toString().padLeft(
                                          2,
                                          '0',
                                        ),
                                    fontSize: Constants.headingSize2,
                                    fontFamily: 'Digital7',
                                    textColor: Constants.primaryTextColor,
                                    textAlign: TextAlign.center,
                                  ),
                                  TitleText(
                                    text: ':${seconds.toString().padLeft(
                                          2,
                                          '0',
                                        )}',
                                    fontSize: Constants.headingSize2,
                                    fontFamily: 'Digital7',
                                    textColor: Constants.primaryTextColor,
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
    );
  }
}
