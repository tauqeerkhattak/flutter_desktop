import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/list_switch_class.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/log_status_item.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class LogSwitchItem extends StatelessWidget {
  final double width;
  final double height;
  final ScrollController scrollController;
  int receiverItemLength;
  int counter = 0;
  final String receiverName;
  List<String> items;
  final ListSwitchClass listSwitchClass;

  LogSwitchItem({
    Key? key,
    required this.width,
    required this.scrollController,
    required this.receiverItemLength,
    required this.items,
    required this.height,
    required this.receiverName,
    required this.listSwitchClass,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          children: List.generate(
            (receiverItemLength / 6).ceil(),
            (index) {
              int numberOfItems = 0;
              if (receiverItemLength > 6) {
                numberOfItems = 6;
                receiverItemLength = receiverItemLength - 6;
              } else {
                numberOfItems = receiverItemLength;
              }
              return SizedBox(
                // width: width * 0.22863970588,
                child: Row(
                  children: [
                    Column(
                      children: List.generate(
                        numberOfItems,
                        (ind) {
                          int random = Random().nextInt(6);
                          return LogStatusItem(
                            listSwitchClass: listSwitchClass,
                            index: ind,
                            random: random,
                            width: width,
                            height: height,
                            statusItemName: items[counter++],
                            status: Status.values[random % 4],
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: width * 0.00919117647,
                        right: width * 0.00919117647,
                        // right: 10,
                        bottom: height * 0.090625,
                      ),
                      width: width * 0.00183823529,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Constants.borderColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned(
          top: -width * 0.025 - 10,
          left: width * 0.01470588235,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff4D4D4D),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            width: 193,
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/linux.png',
                  width: width * 0.01838235294,
                  height: height * 0.071875,
                ),
                SizedBox(
                  width: width * 0.01930147058,
                ),
                TitleText(
                  text: receiverName.toUpperCase(),
                  textColor: Constants.primaryColor,
                  fontSize: (width * height) * 0.00005744485,
                  weight: FontWeight.w800,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
