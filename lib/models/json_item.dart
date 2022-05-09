import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/receiver.dart';

enum Type {
  STEPS,
  EFFECTS,
  CLIENTS,
  RINGS,
}

class JSONItem {
  String? name, text;
  IconData? icon;
  Type? type;
  String? extra;
  List<String>? for_;

  JSONItem({
    this.name,
    this.text,
    this.icon,
    this.type,
  });

  void setExtra(String extra) {
    this.extra = extra;
  }

  String? getExtra() {
    return extra;
  }

  void onDoubleClick(ListItem item, $List list, Receiver receiver) {}
}
