import 'package:flutter/material.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class BottomBar extends StatelessWidget {
  final String text, iconAsset;
  final Function() onTap;
  final bool isSheetOpen;
  const BottomBar({
    Key? key,
    required this.text,
    required this.onTap,
    required this.iconAsset,
    required this.isSheetOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Constants.bottomBarHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Constants.borderColor,
            width: 0.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: TitleText(
                text: text,
                fontSize: Constants.bottomBarText,
                textAlign: TextAlign.left,
                weight: FontWeight.normal,
                textColor: Constants.primaryTextColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: onTap,
              child: SizedBox(
                height: 40,
                width: 40,
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isSheetOpen ? 180 / 360 : 0 / 360,
                  child: Image.asset(
                    iconAsset,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
