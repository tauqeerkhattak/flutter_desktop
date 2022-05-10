import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

import '../utils/constants.dart';

class HomeGridItem extends StatelessWidget {
  final Function() onDoubleTap;
  final Function(PointerHoverEvent) onHover;
  final Border border;
  final String name;
  final String icon;
  final bool enabled;

  const HomeGridItem({
    Key? key,
    required this.onDoubleTap,
    required this.onHover,
    required this.border,
    required this.name,
    required this.icon,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: enabled ? onHover : null,
      child: GestureDetector(
        onDoubleTap: enabled ? onDoubleTap : null,
        child: Container(
          margin: const EdgeInsets.all(
            10,
          ),
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
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
      ),
    );
  }
}
