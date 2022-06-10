import 'package:flutter_desktop/utils/constants.dart';
import 'package:get/get.dart';

class SelectClientController extends GetxController {
  @override
  void onInit() {
    Constants.setWindow(width: 1, height: 1);
    super.onInit();
  }

}
