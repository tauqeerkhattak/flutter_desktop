import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class TopBar extends StatelessWidget {
  final String? icon, receiverName;
  final Color? color;
  const TopBar({
    Key? key,
    this.icon,
    this.receiverName,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        border: Border(
          bottom: BorderSide(
            color: Constants.borderColor,
          ),
          left: BorderSide(
            color: Constants.borderColor,
          ),
          right: BorderSide(
            color: Constants.borderColor,
          ),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 2.5,
        bottom: 2.5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          if (icon != null)
            SizedBox(
              width: 20,
              height: 24,
              child: Image.asset(icon!),
            ),
          const SizedBox(
            width: 20,
          ),
          if (receiverName != null)
            TitleText(
              text: receiverName,
              textColor: Constants.primaryColor,
              // lineHeight: 1.1,
              weight: FontWeight.bold,
              fontSize: Constants.headingSize1 - 9,
            ),
        ],
      ),
    );
  }
}
