import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class EffectsController extends GetxController {
  Rx<int> selectedIndex = (-1).obs;
  int itemsCount = 30;
  int itemHeight = 80;
  int itemWidth = 100;
  Rx<double> cWidth = 0.0.obs;
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
