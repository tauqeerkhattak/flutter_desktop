import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/size_config.dart';

enum ShadowType { dark, light }

class CustomShadow extends StatelessWidget {
  CustomShadow({
    Key? key,
    required this.direction,
    required this.shadowType,
  }) : super(key: key);

  final VerticalDirection direction;
  final ShadowType shadowType;
  final List<Color> blackColors = [
    Colors.black,
    Colors.black.withOpacity(0.9),
    Colors.black.withOpacity(0.8),
    Colors.black.withOpacity(0.7),
    Colors.black.withOpacity(0.6),
    Colors.black.withOpacity(0.5),
    Colors.black.withOpacity(0.4),
    Colors.black.withOpacity(0.3),
    Colors.black.withOpacity(0.2),
  ];
  final List<Color> whiteColors = [
    Colors.grey,
    Colors.grey.withOpacity(0.9),
    Colors.grey.withOpacity(0.8),
    Colors.grey.withOpacity(0.7),
    Colors.grey.withOpacity(0.6),
    Colors.grey.withOpacity(0.5),
    Colors.grey.withOpacity(0.4),
    Colors.grey.withOpacity(0.3),
    Colors.grey.withOpacity(0.2),
  ];
  double? blurRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: direction,
      children: List.generate(blackColors.length, (index) {
        if (index == 0) {
          blurRadius = 8;
        }
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowType == ShadowType.light
                    ? whiteColors[index]
                    : blackColors[index],
                blurRadius: blurRadius!,
                spreadRadius: 4,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.009,
          ),
        );
      }),
    );
  }
}
