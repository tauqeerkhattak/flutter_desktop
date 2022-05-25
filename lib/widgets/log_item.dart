import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/screens/main%20component/main_component.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LogItem extends StatelessWidget {
  final String time;
  final Color? timeColor;
  final String name;
  final String asset;
  final Key logKey;
  final Function(VisibilityInfo) onVisibilityChanged;

  const LogItem({
    Key? key,
    required this.time,
    required this.name,
    required this.asset,
    required this.logKey,
    required this.onVisibilityChanged,
    this.timeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: logKey,
      onVisibilityChanged: onVisibilityChanged,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => MainComponentUI(),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 28,
            top: 11,
            bottom: 11,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: TitleText(
                    text: time,
                    fontSize: Constants.headingSize2,
                    textColor: timeColor ?? Constants.primaryTextColor,
                    fontFamily: 'Digital7',
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TitleText(
                    weight: FontWeight.w600,
                    text: name,
                    textColor: Constants.primaryTextColor,
                    fontSize: Constants.headingSize2 + 2,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  // margin: const EdgeInsets.only(
                  //   left: 10,
                  // ),
                  // width: 30,
                  height: 30,
                  child: Image.asset(
                    asset,
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
