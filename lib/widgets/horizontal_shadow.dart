import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Direction { left, right }

class HorizontalShadow extends StatelessWidget {
  const HorizontalShadow({
    Key? key,
    required this.direction,
    this.shadowWidth,
  }) : super(key: key);

  final Direction direction;
  final double? shadowWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width,
      width: shadowWidth,
      child: Image.asset(
        getDarkShadow(),
        fit: BoxFit.fill,
      ),
    );
  }

  String getDarkShadow() {
    if (direction == Direction.right) {
      return 'assets/icons/right_shadow_light.png';
    } else {
      return 'assets/icons/left_shadow_light.png';
    }
  }
}
