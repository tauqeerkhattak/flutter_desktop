import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

import '../utils/constants.dart';

class BottomBar extends StatelessWidget {
  final String text, iconAsset;
  final Function() onTap;
  const BottomBar({
    Key? key,
    required this.text,
    required this.onTap,
    required this.iconAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: Constants.bottomBarHeight,
      decoration: BoxDecoration(
        color: Colors.black,
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
              margin: const EdgeInsets.only(
                left: 10,
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
                child: Image.asset(
                  iconAsset,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
