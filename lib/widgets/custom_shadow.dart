import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/size_config.dart';

enum ShadowType { dark, light }

class CustomShadow extends StatelessWidget {
  const CustomShadow({
    Key? key,
    required this.direction,
    required this.shadowType,
  }) : super(key: key);

  final VerticalDirection direction;
  final ShadowType shadowType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Image.asset(
        ShadowType.light == shadowType ? getLightShadow() : getDarkShadow(),
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
