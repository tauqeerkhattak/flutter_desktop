enum Type { video, message }

class StatusMenuItem {
  bool? timerDown;
  int? id;
  String? name;
  Type? type;
  String? message;
  double? time;
  bool? timer_down;

  StatusMenuItem({
    this.timerDown,
    this.id,
    this.name,
    this.type,
    this.message,
    this.time,
    this.timer_down,
  });

  void onAdded(String message) {}

  void onRemove(String message) {}
}
