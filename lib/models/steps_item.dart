import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/receiver.dart';

class StepsItem extends JSONItem {
  List? actions;

  StepsItem({
    String? name,
    String? text,
    String? icon,
  }) : super(name: name, text: text, icon: icon);

  @override
  void onDoubleClick(ListItem item, $List list, Receiver receiver) {}
}
