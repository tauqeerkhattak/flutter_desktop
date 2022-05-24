import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ShadowType { dark, light }

class CustomShadow extends StatelessWidget {
  const CustomShadow({
    Key? key,
    required this.direction,
    required this.shadowType,
    this.shadowHeight,
  }) : super(key: key);

  final VerticalDirection direction;
  final ShadowType shadowType;
  final double? shadowHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: shadowHeight,
      child: Image.asset(
        ShadowType.light == shadowType ? getLightShadow() : getDarkShadow(),
        fit: BoxFit.fill,
      ),
    );
  }

  String getLightShadow() {
    if (direction == VerticalDirection.down) {
      return 'assets/icons/light_shadow1.png';
    } else {
      return 'assets/icons/light_shadow.png';
    }
  }

  String getDarkShadow() {
    if (direction == VerticalDirection.down) {
      return 'assets/icons/dark_shadow_down.png';
    } else {
      return 'assets/icons/dark_shadow_up.png';
    }
  }
}
