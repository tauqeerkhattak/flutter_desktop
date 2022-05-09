import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/receiver.dart';

class ClientItem extends JSONItem {
  String? file;

  ClientItem({this.file});

  @override
  void onDoubleClick(ListItem item, $List list, Receiver receiver) {}
}
