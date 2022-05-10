import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/main_button.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';

class $List {
  IconData? icon;
  String? text;
  MainButton? generalMainButton;
  String? generalStatus;
  List<StatusMenuItem>? generalStatusMenuItems;
  List<ListItem>? forAllItemsList;
  Map<String, String>? receiverListItems;
  Receiver? currentReceiver;

  void remove(String name) {
    for (int i = 0; i < forAllItemsList!.length; i++) {
      ListItem listItem = forAllItemsList![i];
      if (listItem.receiver!.name == name) {
        forAllItemsList!.removeAt(i);
      }
    }
  }
}
