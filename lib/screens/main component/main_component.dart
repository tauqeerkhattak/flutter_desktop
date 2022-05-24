import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/main_component_controller.dart';
import 'package:flutter_desktop/models/main_component.dart';
import 'package:flutter_desktop/models/main_component_event.dart';
import 'package:flutter_desktop/screens/list%20switch%20item/list_switch_item.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainComponentUI extends StatelessWidget {
  final controller = Get.put(MainComponentController());
  final MainComponent component = MainComponent(
    events: MainComponentEvent(),
    icon: 'assets/icons/tv.png',
  );

  MainComponentUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Obx(
        () => Row(
          children: [
            SizedBox(
              width: controller.width.value * 0.26500732064,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(
                        color: Constants.borderColor,
                      ),
                    ),
                    color: Colors.black,
                  ),
                  height: double.infinity,
                  // width: 363,
                  alignment: Alignment.bottomCenter,
                  child: TitleText(
                    text: 'Logo.ico',
                    fontSize: Constants.logoSize,
                    textColor: Constants.primaryTextColor,
                    weight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: controller.width.value * 0.02342606149,
            ),
            InkWell(
              onTap: () {
                if (controller.mainButton.value == 'START') {
                  component.startFunction();
                } else {
                  component.stopFunction();
                  Get.to(
                    () => ListSwitchItem(),
                  );
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return ListSwitchItem();
                //     },
                //   ),
                // );
              },
              child: Container(
                width: controller.width.value * 0.18081991215,
                height: double.infinity,
                alignment: Alignment.centerLeft,
                child: TitleText(
                  text: controller.mainButton.value,
                  fontSize: 60,
                  weight: FontWeight.w800,
                  textColor: Constants.primaryTextColor,
                ),
              ),
            ),
            SizedBox(
              width: controller.width.value * 0.01464128843,
            ),
            Container(
              width: controller.width.value * 0.19253294289,
              height: double.infinity,
              alignment: Alignment.centerLeft,
              child: TitleText(
                text: '30:21',
                fontSize: 55,
                fontFamily: 'Digital7',
                weight: FontWeight.w400,
                textColor: Constants.primaryTextColor,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        component.fireEmergency();
                      },
                      child: TitleText(
                        text: 'Emergency'.toUpperCase(),
                        textColor: Constants.error,
                        weight: FontWeight.w800,
                        fontSize: Constants.logoSize,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 7,
                    child: GestureDetector(
                      onTap: () => appWindow.close(),
                      child: SvgPicture.asset(
                        'assets/svg/close.svg',
                      ),
                    ),
                  ),
                  Positioned(
                    right: 62,
                    top: 10,
                    child: GestureDetector(
                      onTap: () => appWindow.minimize(),
                      child: SvgPicture.asset(
                        'assets/svg/min.svg',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 123,
                    child: InkWell(
                      onTap: () {
                        component.updateClients();
                      },
                      child: Container(
                        width: 161,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Constants.borderColor,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: TitleText(
                          text: 'Update Client',
                          fontSize: 20,
                          weight: FontWeight.w500,
                          textColor: Constants.primaryTextColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
