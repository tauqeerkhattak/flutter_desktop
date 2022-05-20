import 'dart:developer';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/size_config.dart';

class Constants {
  static Color primaryColor = Color(0xff66CEDB);
  static Color primaryTextColor = Color(0xffE5E5E5);
  static Color secondaryColor = Colors.grey;
  static Color backgroundColor = Colors.grey.shade800;
  static Color scrollBarColor = Color(0xff707070);
  static Color borderColor = Color(0xffc4c4c4);
  static Color dark = Color(0xff313131);

  // static double headingSize = SizeConfig.screenHeight * 0.04;
  static double headingSize = 36;
  // static double headingSize1 = SizeConfig.screenHeight * 0.03;
  static double headingSize1 = 24;
  // static double headingSize2 = SizeConfig.screenHeight * 0.02;
  static double headingSize2 = 16;
  static double homeItemTextSize = 14;
  static double bottomBarHeight = 44;
  static double bottomBarText = 25;
  static double iconSize = SizeConfig.screenHeight * 0.09;
  static double iconSize1 = SizeConfig.screenHeight * 0.06;
  static double iconSize2 = SizeConfig.screenHeight * 0.04;
  static double mainButtonSize = SizeConfig.screenHeight * 0.1;

  static List<String> icons = [
    'assets/icons/footprints.png',
    'assets/icons/bin.png',
    'assets/icons/camcorder.png',
    'assets/icons/aim.png',
    'assets/icons/double_arrow_down.png',
  ];
  static List<String> names = [
    'Stop now Dead',
    'love',
    'Aha aha aha',
    'We are the loser',
    'love to the end',
    'mRS ZZZZZZ',
    'Stop now with Love Stop now',
  ];
  static List<String> calls = [
    'User Call',
    'Love to the end',
    'Welcome World',
    'Sun is rising',
    'Dead or Alive Dead or Alive',
  ];

  static void setWindow() async {
    Size size = await DesktopWindow.getWindowSize();
    log('Size: ${size.width} ${size.height}');
    doWhenWindowReady(() {
      final initialSize = Size(size.width, size.height);
      appWindow.maxSize = initialSize;
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}
