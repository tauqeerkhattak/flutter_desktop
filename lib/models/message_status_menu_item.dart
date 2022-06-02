import 'package:flutter_desktop/models/status_menu_item.dart';

class MessageStatusMenuItem extends StatusMenuItem {
  @override
  Type? type = Type.message;

  MessageStatusMenuItem({
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
