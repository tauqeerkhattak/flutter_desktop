import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/data.dart';
import 'package:flutter_desktop/screens/home/home.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.setWindow(width: 0.25, height: 0.65);
  Data.initialize();
  runApp(const FlutterDesktop());
}

class FlutterDesktop extends StatelessWidget {
  const FlutterDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
