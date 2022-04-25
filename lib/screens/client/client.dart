import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class Client extends StatelessWidget {
  const Client({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              child: TitleText(
                text: 'CLIENT',
                fontSize: 24,
                weight: FontWeight.bold,
                textColor: Constants.primaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
