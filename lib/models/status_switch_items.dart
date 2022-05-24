enum Status { on, off }
enum On { high, low }

class StatusSwitchItem {
  String receiverName;
  String name;
  String? icon;
  Status status;
  bool inputPin;
  List<dynamic> value;
  Status default_;
  On on;

  StatusSwitchItem({
    required this.receiverName,
    required this.name,
    required this.status,
    required this.value,
    required this.default_,
    required this.on,
    this.inputPin = false,
    this.icon,
  });

  void onDoubleClick() {}

  void onLongPress() {}
}
