import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/list_switch_controller.dart';
import 'package:flutter_desktop/models/list_switch_class.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/border_box.dart';
import 'package:flutter_desktop/widgets/custom_scroll_bar.dart';
import 'package:flutter_desktop/widgets/horizontal_animation.dart';
import 'package:flutter_desktop/widgets/log_switch_item.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ListSwitchItem extends StatelessWidget {
  final controller = Get.put(ListSwitchController());
  final List<String> items = [
    'Lorem ipsum',
    'Dolor sit',
    'Consectetuer',
    'Adipiscing elit',
    'Diam',
    'Nonummy nibh',
    'Tincidunt',
    'Ut laoreet',
    'Magna',
    'Aliquam erat',
    'Ut',
    'Wisi enim',
    'Minim',
    'Veniam quis',
    'Exerci',
  ];
  ListSwitchItem({Key? key}) : super(key: key);
  ListSwitchClass listSwitchClass = ListSwitchClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onLongPress: () => appWindow.startDragging(),
        child: BorderBox(
          backgroundColor: const Color(0xff313131),
          right: 5,
          bottom: 5,
          child: Stack(
            children: [
              HorizontalAnimation(
                shadowWidth: 100,
                controller: controller,
                child: CustomScrollBar(
                  controller: controller.scrollController,
                  color: Constants.scrollBarColor,
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.receivers.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      top: 50,
                      // left: 20,
                    ),
                    itemBuilder: (context, index) {
                      return AutoScrollTag(
                        key: ValueKey(index),
                        controller: controller.scrollController,
                        index: index,
                        child: Obx(
                          () => LogSwitchItem(
                            listSwitchClass: listSwitchClass,
                            width: controller.width.value,
                            height: controller.height.value,
                            receiverName: controller.receivers[index],
                            scrollController: controller.scrollController,
                            items: items,
                            receiverItemLength: items.length,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 50,
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    listSwitchClass.scrollBackward();
                    if (controller.currentIndex != 0) {
                      controller.currentIndex--;
                      print('INDEX: ${controller.currentIndex}');
                      controller.scrollController
                          .scrollToIndex(controller.currentIndex);
                    } else if (controller.currentIndex == 0) {
                      print('INDEX: ${controller.currentIndex}');
                      controller.scrollController
                          .scrollToIndex(controller.currentIndex);
                    }
                  },
                ),
              ),
              Positioned(
                top: 0,
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.forward,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    listSwitchClass.scrollForward();
                    if (controller.currentIndex !=
                        controller.receivers.length) {
                      print('INDEX: ${controller.currentIndex}');
                      controller.currentIndex++;
                      controller.scrollController.scrollToIndex(
                        controller.currentIndex,
                        preferPosition: AutoScrollPosition.begin,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
