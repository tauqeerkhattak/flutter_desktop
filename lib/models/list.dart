import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/list_receiver.dart';
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
  Map<dynamic, List<ListItem>>? receiverListItems;
  Receiver? currentReceiver;
  ListReceiver receiver = ListReceiver();

  void remove(String name) {
    List<dynamic> keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      var receiver = keys[i];
      List<ListItem>? items = receiverListItems![receiver];
      for (int j = 0; j < items!.length; j++) {
        if (items[j].receiver!.name == name) {
          receiverListItems![receiver]!.removeAt(j);
        }
      }
    }
    for (int i = 0; i < forAllItemsList!.length; i++) {
      if (forAllItemsList![i].receiver!.name == name) {
        forAllItemsList!.removeAt(i);
      }
    }
  }

  void remove1(String name, String receiverName) {
    if (receiverName.isEmpty || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        ListItem item = forAllItemsList![i];
        if (item.receiver!.name == name) {
          forAllItemsList!.removeAt(i);
        }
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        if (keys[i].name == receiverName) {
          List<ListItem>? items = receiverListItems![keys[i]];
          for (int j = 0; j < items!.length; j++) {
            if (items[j].receiver!.name == name) {
              receiverListItems![keys[i]]!.removeAt(j);
            }
          }
        }
      }
    }
  }

  void remove2(String name, Receiver receiver) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i] == receiver) {
        List<ListItem>? items = receiverListItems![keys[i]];
        // for (int j = 0)
      }
    }
  }
}
