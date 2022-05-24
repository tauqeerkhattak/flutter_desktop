import 'package:flutter_desktop/models/main_component.dart';

class MainComponentEvent {
  onTimeUP(MainComponent owner) {}
  onTimeStarted(MainComponent owner) {}
  onTimeStopped(MainComponent owner) {}
  onTimePaused(MainComponent owner) {}
  onReset(MainComponent owner) {}
  onTimeSet(MainComponent owner, int newTime) {}
  onEmergencyClick(MainComponent owner) {}
  onStart(MainComponent owner) {}
  onStop(MainComponent owner) {}
  onExtraCountdownTime(MainComponent owner, int time) {}
  onUpdateClients(MainComponent owner) {}
}
