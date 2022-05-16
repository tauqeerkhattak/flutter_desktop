import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;
  final Color color;
  const CustomScrollBar({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: color,
      thickness: 10,
      radius: const Radius.circular(
        15,
      ),
      // timeToFade: Duration(seconds: 100),
      crossAxisMargin: 5,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: child,
      ),
    );
  }
}
