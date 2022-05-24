import 'package:flutter_desktop/controllers/main_component_controller.dart';
import 'package:flutter_desktop/models/main_component_event.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

enum CountDownStatus {
  STARTED,
  STOPPED,
  PAUSED,
}

enum AppStatus {
  STARTED,
  STOPPED,
  EMERGENCY,
}

class MainComponent {
  String icon;
  MainComponentEvent events;
  int countDownTime = 3600000;
  CountDownStatus? countDownStatus;
  AppStatus? appStatus;
  StopWatchTimer? timer;
  bool reset = false;
  final controller = Get.find<MainComponentController>();

  MainComponent({
    required this.icon,
    required this.events,
  });

  void setCountDownTime(int timeInMillis) {
    countDownTime = timeInMillis;
    timer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: countDownTime,
    );
    events.onTimeSet(this, countDownTime);
  }

  void stopCountDown() {
    countDownTime = 3600000;
    timer?.onExecute.add(StopWatchExecute.stop);
    timer?.setPresetTime(mSec: countDownTime);
    events.onTimeStopped(this);
    countDownStatus = CountDownStatus.STOPPED;
  }

  void pauseCountDown() {
    countDownTime = 3600000;
    timer?.onExecute.add(StopWatchExecute.stop);
    timer?.setPresetTime(mSec: countDownTime);
    events.onTimePaused(this);
    countDownStatus = CountDownStatus.PAUSED;
  }

  void resetCountDown() {
    countDownTime = 3600000;
    timer?.onExecute.add(StopWatchExecute.reset);
    timer?.setPresetTime(mSec: countDownTime);
    reset = true;
    events.onReset(this);
  }

  void startCountDown() {
    if (reset) {
      setCountDownTime(countDownTime);
      timer?.onExecute.add(StopWatchExecute.start);
    } else {
      timer?.onExecute.add(StopWatchExecute.start);
    }
    events.onTimeStarted(this);
  }

  void startFunction() {
    if (controller.mainButton.value == 'START') {
      controller.mainButton.value = 'STOP';
      events.onStart(this);
      appStatus = AppStatus.STARTED;
    }
  }

  void stopFunction() {
    if (controller.mainButton.value == 'STOP') {
      controller.mainButton.value = 'START';
      events.onStop(this);
      appStatus = AppStatus.STOPPED;
    }
  }

  void updateClients() {
    events.onUpdateClients(this);
  }

  void fireEmergency() {
    events.onEmergencyClick(this);
    appStatus = AppStatus.EMERGENCY;
  }

  void addExtraCountDownTime(int time) {
    events.onExtraCountdownTime(this, time);
  }
}
