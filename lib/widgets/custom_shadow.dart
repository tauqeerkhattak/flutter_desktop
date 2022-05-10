import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/size_config.dart';

enum ShadowType { dark, light }

class CustomShadow extends StatelessWidget {
  CustomShadow({
    Key? key,
    required this.direction,
    required this.shadowType,
    required this.width,
    required this.spreadRadius,
  }) : super(key: key);

  final VerticalDirection direction;
  final ShadowType shadowType;
  final double spreadRadius;
  final double width;
  final List<Color> blackColors = [
    Colors.black,
    Colors.black.withOpacity(0.95),
    Colors.black.withOpacity(0.9),
    Colors.black.withOpacity(0.85),
    Colors.black.withOpacity(0.8),
    // Colors.black.withOpacity(0.75),
    // Colors.black.withOpacity(0.7),
    // Colors.black.withOpacity(0.65),
    // Colors.black.withOpacity(0.6),
    // Colors.black.withOpacity(0.55),
    // Colors.black.withOpacity(0.5),
    // Colors.black.withOpacity(0.45),
    // Colors.black.withOpacity(0.4),
    Colors.black.withOpacity(0.35),
    Colors.black.withOpacity(0.3),
    Colors.black.withOpacity(0.25),
    Colors.black.withOpacity(0.2),
    Colors.black.withOpacity(0.15),
    Colors.black.withOpacity(0.1),
  ];
  final List<Color> whiteColors = [
    Colors.white.withOpacity(0.32),
    Colors.white.withOpacity(0.3),
    Colors.white.withOpacity(0.28),
    Colors.white.withOpacity(0.25),
    Colors.white.withOpacity(0.22),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.18),
    Colors.white.withOpacity(0.15),
    Colors.white.withOpacity(0.1),
    Colors.white.withOpacity(0.05),
  ];
  double? blurRadius;

  @override
  // Widget build(BuildContext context) {
  //   int length = (shadowType == ShadowType.light)
  //       ? whiteColors.length
  //       : blackColors.length;
  //   return Container(
  //     height: SizeConfig.screenHeight * 0.07,
  //     decoration: BoxDecoration(
  //       boxShadow: [
  //         for (int i = 0; i < length; i++)
  //           BoxShadow(
  //               color: shadowType == ShadowType.light
  //                   ? whiteColors[i]
  //                   : blackColors[i],
  //               blurRadius: 10,
  //               spreadRadius: 4),
  //         // BoxShadow(
  //         //     spreadRadius: 50,
  //         //     color: Colors.green.withOpacity(.3),
  //         //     blurRadius: 15)
  //       ],
  //       // gradient: LinearGradient(
  //       //   begin: direction == VerticalDirection.up
  //       //       ? Alignment.bottomCenter
  //       //       : Alignment.topCenter,
  //       //   end: direction == VerticalDirection.up
  //       //       ? Alignment.topCenter
  //       //       : Alignment.bottomCenter,
  //       //   colors: shadowType == ShadowType.light
  //       //       ? whiteColors
  //       //       : [
  //       //           Colors.black,
  //       //           Colors.black45,
  //       //         ],
  //       // ),
  //     ),
  //     margin: EdgeInsets.zero,
  //     padding: EdgeInsets.zero,
  //   );
  // }
// }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        verticalDirection: direction,
        children: List.generate(
            shadowType == ShadowType.light
                ? whiteColors.length
                : blackColors.length, (index) {
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
                  spreadRadius: spreadRadius,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * width,
            ),
          );
        }),
      ),
    );
  }
}
