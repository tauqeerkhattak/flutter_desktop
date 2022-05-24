import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class LogItem extends StatelessWidget {
  final String time;
  final String name;
  final String asset;

  const LogItem({
    Key? key,
    required this.time,
    required this.name,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 28,
        top: 11,
        bottom: 11,
      ),
      child: Row(
        children: [
          TitleText(
            text: time,
            fontSize: Constants.headingSize2 + 5,
            textColor: Constants.primaryTextColor,
            fontFamily: 'Digital7',
          ),
          Expanded(
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
          Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            width: 30,
            height: 30,
            child: Image.asset(
              asset,
            ),
          ),
        ],
      ),
    );
  }
}
