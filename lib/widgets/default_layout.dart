import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/utils/size_config.dart';
import 'package:flutter_desktop/widgets/title_text.dart';

class DefaultLayout extends StatefulWidget {
  final String title;
  final Widget child;
  final String? buttonText;

  DefaultLayout({
    Key? key,
    required this.title,
    required this.child,
    this.buttonText,
  }) : super(key: key);

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  Color backgroundColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          left: 15,
          top: SizeConfig.screenHeight * 0.04,
          child: Row(
            children: [
              // IconButton(
              //   icon: Icon(
              //     Icons.arrow_back,
              //     color: Constants.primaryTextColor,
              //     size: Constants.iconSize2,
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                child: TitleText(
                  text: widget.title,
                  fontSize: Constants.headingSize,
                  weight: FontWeight.bold,
                  textColor: Constants.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
        if (widget.buttonText != null)
          Positioned(
            right: 30,
            child: Material(
              color: backgroundColor,
              child: InkWell(
                onTap: () {
                  log('Main Button pressed');
                },
                onHover: (hover) {
                  print('hovering');
                  if (hover) {
                    setState(() {
                      backgroundColor = Constants.backgroundColor;
                    });
                  } else {
                    setState(() {
                      backgroundColor = Colors.black;
                    });
                  }
                },
                child: Container(
                  width: 132,
                  height: 67,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Constants.borderColor,
                      ),
                      right: BorderSide(
                        color: Constants.borderColor,
                      ),
                      bottom: BorderSide(
                        color: Constants.borderColor,
                      ),
                    ),
                    // color: Colors.black,
                  ),
                  alignment: Alignment.center,
                  child: TitleText(
                    text: widget.buttonText,
                    lineHeight: 1,
                    textColor: Constants.primaryTextColor,
                    textAlign: TextAlign.center,
                    fontSize: Constants.headingSize1,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
