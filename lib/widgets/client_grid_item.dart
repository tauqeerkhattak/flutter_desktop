import 'package:badges/badges.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class ClientGridItem extends StatelessWidget {
  final Function(PointerHoverEvent) onHover;
  final Function() onDoubleTap;
  final Border border;
  final String name;
  final bool showBadge;
  const ClientGridItem({
    Key? key,
    required this.onHover,
    required this.onDoubleTap,
    required this.name,
    required this.border,
    required this.showBadge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: onHover,
      child: GestureDetector(
        onDoubleTap: onDoubleTap,
        child: Container(
          width: 94,
          height: 137,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          padding: const EdgeInsets.all(3.0),
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Badge(
                  badgeContent: Icon(
                    Icons.play_arrow,
                    color: Constants.primaryTextColor,
                    size: 30,
                  ),
                  badgeColor: Colors.transparent,
                  elevation: 0.0,
                  position: const BadgePosition(
                    bottom: 0,
                    end: 0,
                  ),
                  showBadge: showBadge,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/clouds.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: TitleText(
                    text: name,
                    textColor: Constants.primaryTextColor,
                    textAlign: TextAlign.center,
                    fontSize: Constants.homeItemTextSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}