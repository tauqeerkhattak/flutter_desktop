import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/receiver.dart';

class RingsItem extends JSONItem {
  String? media;

  RingsItem({this.media});

  @override
  void onDoubleClick(ListItem item, $List list, Receiver receiver) {}
}
