import 'package:flutter/material.dart';
import 'package:flutter_desktop/utils/constants.dart';
import 'package:flutter_desktop/widgets/title_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VideoStatusUI extends StatelessWidget {
  final String text;
  final int time;
  final bool timerDown;

  const VideoStatusUI({
    Key? key,
    required this.text,
    required this.timerDown,
    required this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 4,
              ),
              child: TitleText(
                text: text,
                fontSize: Constants.headingSize2,
                textColor: Constants.primaryTextColor,
                weight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(
                left: 4,
                right: 5,
              ),
              child: !timerDown
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TitleText(
                          text: getTime(),
                          fontSize: Constants.headingSize2,
                          fontFamily: 'Digital7',
                          textColor: Constants.primaryTextColor,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Countdown(
                      seconds: time,
                      build: (BuildContext context, double time) {
                        int minutes = time ~/ 60;
                        int seconds = (time % 60).toInt();
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleText(
                              text: minutes.toString().padLeft(
                                    2,
                                    '0',
                                  ),
                              fontSize: Constants.headingSize2,
                              fontFamily: 'Digital7',
                              textColor: Constants.primaryTextColor,
                              textAlign: TextAlign.center,
                            ),
                            TitleText(
                              text: ':${seconds.toString().padLeft(
                                    2,
                                    '0',
                                  )}',
                              fontSize: Constants.headingSize2,
                              fontFamily: 'Digital7',
                              textColor: Constants.primaryTextColor,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(
                left: 5,
                right: 8,
              ),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 21,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/svg/re-loop.svg',
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 8,
              right: 28,
            ),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 21,
                height: 24,
                child: SvgPicture.asset(
                  'assets/svg/cancel.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getTime() {
    int minutes = time ~/ 60;
    int secondsRemaining = time.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${secondsRemaining.toString().padLeft(2, '0')}';
  }
}
