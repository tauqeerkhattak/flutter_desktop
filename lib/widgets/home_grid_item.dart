import 'package:flutter/material.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

import '../utils/constants.dart';

class HomeGridItem extends StatelessWidget {
  final Function() onDoubleTap;
  final String name;
  final String icon;
  final bool enabled;

  const HomeGridItem({
    Key? key,
    required this.onDoubleTap,
    required this.name,
    required this.icon,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.transparency,
      child: InkWell(
        focusColor: Colors.yellowAccent,
        onDoubleTap: enabled ? onDoubleTap : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: Image.asset(
                icon,
                color: enabled ? Colors.white : const Color(0xff818181),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 13,
                right: 13,
              ),
              child: TitleText(
                text: name,
                fontSize: Constants.homeItemTextSize,
                textColor: enabled
                    ? Constants.primaryTextColor
                    : const Color(0xff818181),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
