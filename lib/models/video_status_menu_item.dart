import 'package:flutter_desktop/models/main_button.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';

class VideoStatusMenuItem extends StatusMenuItem {
  @override
  Type? type = Type.video;
  bool? showTools;
  bool? isLoop;
  MainButton? cancel;
  Function()? onCancelClicked;
  MainButton? loopSwitch;
  Function()? onLoopSwitchClicked;

  VideoStatusMenuItem({
    int? id,
    String? name,
    int? time,
    bool? timer_down,
  }) : super(
          id: id,
          name: name,
          time: time,
          timerDown: timer_down,
        );
}
