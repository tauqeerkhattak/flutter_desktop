import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/receiver.dart';

class StepsItem extends JSONItem {
  List? actions;

  StepsItem({this.actions});

  @override
  void onDoubleClick(ListItem item, $List list, Receiver receiver) {}
}
