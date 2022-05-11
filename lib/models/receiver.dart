import 'package:flutter_desktop/models/client.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';

class Receiver extends Client {
  bool? ghost;
  $List? owner;
  String? status;
  List<StatusMenuItem>? statusMenuItems;

  Receiver({
    this.ghost = false,
    this.owner,
    this.status,
    this.statusMenuItems,
  });

  void setOwner($List owner) {
    this.owner = owner;
  }

  $List? getOwner() {
    return owner;
  }

  bool compare(Receiver to) {
    return (name == to.name);
  }

  bool? drawIt() {
    return !ghost!;
  }
}
