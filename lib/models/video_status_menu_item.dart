import 'package:flutter_desktop/models/main_button.dart';

enum Type { video, message }

class VideoStatusMenuItem {
  Type? type = Type.video;
  bool? showTools;
  bool? isLoop;
  MainButton? cancel;
  Function()? onCancelClicked;
  MainButton? loopSwitch;
  Function()? onLoopSwitchClicked;

  VideoStatusMenuItem({
    this.type,
    this.showTools,
    this.isLoop,
    this.cancel,
    this.onCancelClicked,
    this.loopSwitch,
    this.onLoopSwitchClicked,
  });
}
