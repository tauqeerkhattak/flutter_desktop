import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  bool? horizontal;
  final double? margin;

  BorderBox({
    Key? key,
    required this.backgroundColor,
    required this.child,
    this.horizontal = false,
    this.margin,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: margin ?? 5,
        right: margin ?? 5,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: Constants.borderColor,
          ),
          horizontal: horizontal!
              ? BorderSide(
                  color: Constants.borderColor,
                )
              : BorderSide.none,
        ),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
