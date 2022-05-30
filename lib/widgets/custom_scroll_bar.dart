import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;
  final Color color;
  final ScrollController controller;
  final double? leftMargin;
  const CustomScrollBar({
    Key? key,
    required this.child,
    required this.color,
    this.leftMargin,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      thumbColor: color,
      thickness: 8,
      radius: const Radius.circular(
        15,
      ),
      // timeToFade: Duration(seconds: 100),
      crossAxisMargin: leftMargin ?? 5,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: child,
      ),
    );
  }
}
