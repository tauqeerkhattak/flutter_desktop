import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/size_config.dart';

class CustomShadow extends StatelessWidget {
  final VerticalDirection direction;
  CustomShadow({Key? key, required this.direction}) : super(key: key);
  final List<Color> colors = [
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
  double? blurRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: direction,
      children: List.generate(colors.length, (index) {
        if (index == 0) {
          blurRadius = 8;
        }
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: colors[index],
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
