import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class ClientGridItem extends StatelessWidget {
  final Function() onDoubleTap;
  final String name;
  final bool showBadge;
  final bool hovered;
  const ClientGridItem({
    Key? key,
    required this.onDoubleTap,
    required this.name,
    required this.showBadge,
    required this.hovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Container(
        width: 94,
        height: 137,
        padding: const EdgeInsets.all(3.0),
        margin: const EdgeInsets.all(5),
        decoration: hovered
            ? BoxDecoration(
                color: Constants.backgroundColor.withRed(50),
                borderRadius: BorderRadius.circular(15),
              )
            : null,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Badge(
                  badgeContent: Icon(
                    Icons.play_arrow,
                    color: Constants.primaryTextColor,
                    size: 30,
                  ),
                  badgeColor: Colors.transparent,
                  toAnimate: false,
                  elevation: 0.0,
                  position: const BadgePosition(
                    bottom: 5,
                    end: 0,
                  ),
                  showBadge: showBadge,
                  child: Container(
                    width: 100,
                    height: 75,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/clouds.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
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
    );
  }
}
