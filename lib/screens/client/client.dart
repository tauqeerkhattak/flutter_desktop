import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class Client extends StatelessWidget {
  const Client({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      color: Constants.backgroundColor,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      bottom: BorderSide(
                        color: Constants.primaryTextColor,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ImageIcon(
                        const AssetImage(
                          'assets/icons/linux.png',
                        ),
                        size: 35,
                        color: Constants.primaryTextColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TitleText(
                        text: 'DOOM GAVE',
                        textColor: Constants.primaryColor,
                        weight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Container(
                    width: SizeConfig.screenWidth * 0.4,
                    height: SizeConfig.screenHeight * 0.13,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Constants.primaryTextColor,
                      ),
                      color: Colors.black,
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(
                      3,
                    ),
                    child: TitleText(
                      text: 'Send Message',
                      textColor: Constants.primaryTextColor,
                      textAlign: TextAlign.center,
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      FluentIcons.back,
                      size: 20,
                      color: Constants.primaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TitleText(
                    text: 'CLIENT',
                    fontSize: 24,
                    weight: FontWeight.bold,
                    textColor: Constants.primaryTextColor,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
