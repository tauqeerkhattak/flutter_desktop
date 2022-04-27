import 'dart:developer';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static Color primaryColor = Colors.blue;
  static Color primaryTextColor = Colors.white;
  static Color secondaryColor = Colors.grey;
  static Color backgroundColor = Colors.grey.shade800;

  static List<String> icons = [
    'assets/icons/footprints.png',
    'assets/icons/bin.png',
    'assets/icons/camcorder.png',
    'assets/icons/aim.png',
  ];
  static List<String> names = [
    'Stop now Dead',
    'love',
    'Aha aha aha',
    'We are the loser',
    'love to the end',
    'mRS ZZZZZZ',
    'Stop now with Love',
  ];

  static void setWindow() async {
    Size size = await DesktopWindow.getWindowSize();
    log('Size: ${size.width} ${size.height}');
    await DesktopWindow.setMinWindowSize(Size(size.width, size.height));
    await DesktopWindow.setMaxWindowSize(Size(size.width, size.height));
  }
}
