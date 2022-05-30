import 'package:flutter/material.dart';
import 'package:flutter_desktop/controllers/select_client_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SelectClient extends StatelessWidget {
  final controller = Get.put(SelectClientController());
  SelectClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      body: Stack(
        children: [
          Positioned(
            top: 32.21,
            right: 32.21,
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/svg/close.svg',
                width: 35,
                height: 33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
