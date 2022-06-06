import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/list_switch_class.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:flutter_svg/svg.dart';

enum Status {
  onInput,
  onNoInput,
  offInput,
  offNoInput,
}

class LogStatusItem extends StatelessWidget {
  final int index, random;
  final double width;
  final double height;
  final Status status;
  final String statusItemName;
  final ListSwitchClass listSwitchClass;

  const LogStatusItem({
    Key? key,
    required this.index,
    required this.random,
    required this.width,
    required this.height,
    required this.status,
    required this.statusItemName,
    required this.listSwitchClass,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          top: 2.5,
          bottom: 2.5,
        ),
        width: 227,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (index == random)
                ? Image.asset(
                    Constants.icons[random],
                    width: 24,
                    height: 24,
                  )
                : const SizedBox(
                    width: 24,
                    height: 24,
                  ),
            Container(
              alignment: Alignment.center,
              child: TitleText(
                text: 'Finnish Shoot',
                fontSize: width * 0.01838235294,
                weight: FontWeight.w500,
                textColor: Constants.primaryTextColor,
              ),
            ),
            getStatusItem(
              index,
              random,
            ),
          ],
        ),
      ),
    );
  }

  Widget getStatusItem(int index, int random) {
    if (status == Status.onNoInput) {
      return SizedBox(
        height: 16,
        width: 16,
        child: SvgPicture.asset('assets/svg/normal on.svg'),
      );
    } else if (status == Status.offInput) {
      return SizedBox(
        height: 16,
        width: 16,
        child: SvgPicture.asset('assets/svg/input off.svg'),
      );
    } else if (status == Status.onInput) {
      return SizedBox(
        height: 16,
        width: 16,
        child: SvgPicture.asset('assets/svg/input on.svg'),
      );
    } else {
      return const SizedBox(
        height: 16,
        width: 16,
      );
    }
  }
}
