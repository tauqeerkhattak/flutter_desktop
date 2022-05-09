import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class ClientGridItem extends StatelessWidget {
  final Function(PointerHoverEvent) onHover;
  final Function() onDoubleTap;
  final Border border;
  final String name;
  const ClientGridItem({
    Key? key,
    required this.onHover,
    required this.onDoubleTap,
    required this.name,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: onHover,
      child: GestureDetector(
        onDoubleTap: onDoubleTap,
        child: Container(
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
              Expanded(
                flex: 4,
                child: Center(
                  child: TitleText(
                    text: name,
                    textColor: Constants.primaryTextColor,
                    textAlign: TextAlign.center,
                    fontSize: Constants.headingSize1,
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
