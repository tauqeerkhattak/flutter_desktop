import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/custom_shadow.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

import 'custom_animation.dart';

class CustomSheet {
  static void showBottomSheet({
    required BuildContext context,
    required controller,
    required String title,
    required IconData titleIcon,
    required String buttonText,
    required String subtitle,
    required int subtitleIconsLength,
    required String bottomText,
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
                            size: 30,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: TitleText(
                            text: title,
                            textColor: Constants.primaryColor,
                            weight: FontWeight.bold,
                            fontSize: 24,
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
                    flex: 3,
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
                                fontSize: 24,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  subtitleIconsLength,
                                  (index) {
                                    return ImageIcon(
                                      AssetImage(
                                        Constants.icons[index + 1],
                                      ),
                                      color: Constants.primaryTextColor,
                                      size: 50,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: CustomAnimation(
                      controller: controller,
                      shadowType: ShadowType.light,
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
                                  flex: 5,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: TitleText(
                                      text: Constants.names[
                                          index % Constants.names.length],
                                      fontSize: 20,
                                      textColor: Constants.primaryTextColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: TitleText(
                                    text: '120 : 04',
                                    fontSize: 30,
                                    fontFamily: 'Digital7',
                                    textColor: Constants.primaryTextColor,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.refresh_bold,
                                      color: Constants.primaryTextColor,
                                      size: 30,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: const Icon(
                                      CupertinoIcons.clear,
                                      color: Colors.red,
                                      size: 30,
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
                    flex: 1,
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
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Constants.primaryTextColor,
                                size: 30,
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
                  height: SizeConfig.screenHeight * 0.135,
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
                    fontSize: 24,
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
