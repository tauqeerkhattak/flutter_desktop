import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const BorderBox({
    Key? key,
    required this.backgroundColor,
    required this.child,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
        top: top ?? 0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Constants.borderColor,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: Constants.borderColor,
            width: 0.0,
          ),
          left: BorderSide(
            color: Constants.borderColor,
            width: 0.0,
          ),
          right: BorderSide(
            color: Constants.borderColor,
            width: 0.0,
          ),
        ),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
