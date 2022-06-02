enum Type { video, message }

class StatusMenuItem {
  bool? timerDown;
  int? id;
  String? name;
  Type? type;
  String? message;
  int? time;

  StatusMenuItem({
    this.timerDown,
    this.id,
    this.name,
    this.type,
    this.message,
    this.time,
  });

  void onAdded(String message) {}

  void onRemove(String message) {}
}
