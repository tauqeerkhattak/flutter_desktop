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
    return GestureDetector(
      onDoubleTap: enabled ? onDoubleTap : null,
      child: Container(
        margin: const EdgeInsets.all(
          10,
        ),
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                height: 32.7,
                width: 48,
                child: Image.asset(
                  icon,
                  color: enabled ? Colors.white : Colors.grey,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: TitleText(
                text: name,
                fontSize: Constants.homeItemTextSize,
                textColor: enabled ? Constants.primaryTextColor : Colors.grey,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
