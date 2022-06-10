import 'dart:developer' as dev;

import 'package:flutter_desktop/controllers/home_controller.dart';
import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/list_receiver.dart';
import 'package:flutter_desktop/models/main_button.dart';
import 'package:flutter_desktop/models/main_button_list.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';
import 'package:flutter_desktop/models/status_menu_item_list.dart';
import 'package:flutter_desktop/models/temp_receiver.dart';
import 'package:get/get.dart';

class $List {
  String? icon;
  String? text;
  String? name;
  MainButton? generalMainButton;
  String? generalStatus;
  List<StatusMenuItem>? generalStatusMenuItems;
  List<ListItem>? forAllItemsList = [];
  Map<Receiver, List<ListItem>>? receiverListItems =
      <Receiver, List<ListItem>>{};
  Receiver? currentReceiver;

  $List({
    this.name,
    this.text,
    this.icon,
  });

  void add(JSONItem item) {
    bool found = false;
    if (item.for_ == null || item.for_!.isEmpty) {
      ListItem listItem = ListItem();
      forAllItemsList!.add(listItem);
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        receiverListItems![keys[i]]!.add(listItem);
      }
    } else {
      for (int i = 0; i < item.for_!.length; i++) {
        ListItem listItem = ListItem(item: item);
        final keys = receiverListItems!.keys.toList();
        for (int j = 0; j < keys.length; j++) {
          if (keys[j].name == item.name) {
            receiverListItems![keys[j]]!.add(listItem);
            found = true;
          }
        }
        if (!found) {
          TempReceiver tempReceiver = TempReceiver(name: item.name!);
          receiverListItems!.addAll({tempReceiver: forAllItemsList!});
          receiverListItems!.putIfAbsent(tempReceiver, () => [listItem]);
        }
      }
    }
  }

  void remove(String name) {
    final keys = receiverListItems!.keys.toList();
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
          break;
        }
      }
    }
  }

  void remove2(String name, Receiver? receiver) {
    if (receiver == null) {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        if (forAllItemsList![i].receiver!.name == name) {
          forAllItemsList!.removeAt(i);
        }
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        if (keys[i] == receiver) {
          List<ListItem>? items = receiverListItems![keys[i]];
          for (int j = 0; j < items!.length; j++) {
            if (items[j].receiver!.name == name) {
              receiverListItems![keys[i]]!.removeAt(j);
            }
          }
          break;
        }
      }
    }
  }

  void removeAll(Receiver? receiver) {
    if (receiver == null) {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList!.removeAt(i);
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver temp = keys[i];
        if (receiver.name == temp.name) {
          List<ListItem>? items = receiverListItems![receiver];
          for (int j = 0; j < items!.length; j++) {
            receiverListItems![receiver]!.removeAt(j);
          }
          break;
        }
      }
    }
  }

  void removeAll1(String? receiverName) {
    if (receiverName == null || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList!.removeAt(i);
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver receiver = keys[i];
        if (receiver.name == receiverName) {
          List<ListItem>? items = receiverListItems![receiver];
          for (int j = 0; j < items!.length; j++) {
            receiverListItems![receiver]!.removeAt(j);
          }
        }
      }
    }
  }

  void disable(String name) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      Receiver receiver = keys[i];
      List<ListItem>? items = receiverListItems![receiver];
      for (int j = 0; j < items!.length; j++) {
        if (items[j].receiver!.name == name) {
          receiverListItems![receiver]![j].disable = true;
        }
      }
    }
    for (int i = 0; i < forAllItemsList!.length; i++) {
      if (forAllItemsList![i].receiver!.name == name) {
        //TODO Check this for later
        forAllItemsList![i].disable = true;
      }
    }
  }

  void disable1(String name, String? receiverName) {
    if (receiverName == null || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        if (name == forAllItemsList![i].receiver!.name) {
          forAllItemsList![i].disable = true;
        }
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver receiver = keys[i];
        if (receiver.name == receiverName) {
          List<ListItem>? items = receiverListItems![receiver];
          for (int j = 0; j < items!.length; j++) {
            if (items[j].receiver!.name == name) {
              receiverListItems![receiver]![j].disable = true;
            }
          }
        }
      }
    }
  }

  void disable2(String name, Receiver? receiver) {
    if (receiver == null) {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        if (name == forAllItemsList![i].receiver!.name) {
          forAllItemsList!.removeAt(i);
        }
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver temp = keys[i];
        if (receiver == temp) {
          List<ListItem>? items = receiverListItems![temp];
          for (int j = 0; j < items!.length; j++) {
            if (items[j].receiver!.name == name) {
              receiverListItems![temp]![j].disable = true;
            }
          }
          break;
        }
      }
    }
  }

  void disableAll(Receiver? receiver) {
    if (receiver == null) {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList![i].disable = true;
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver temp = keys[i];
        List<ListItem>? items = receiverListItems![receiver];
        if (receiver.name == temp.name) {
          for (int j = 0; j < items!.length; j++) {
            receiverListItems![receiver]![j].disable = true;
          }
          break;
        }
      }
    }
  }

  void disableAll1(String? receiverName) {
    if (receiverName == null || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList![i].disable = true;
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver receiver = keys[i];
        List<ListItem>? items = receiverListItems![receiver];
        for (int j = 0; j < items!.length; j++) {
          receiverListItems![receiver]![j].disable = true;
        }
      }
    }
  }

  void hide(String name) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      List<ListItem>? items = receiverListItems![keys[i]];
      for (int j = 0; j < items!.length; j++) {
        if (items[j].receiver!.name == name) {
          receiverListItems![keys[i]]![j].hide = true;
        }
      }
    }
    for (int i = 0; i < forAllItemsList!.length; i++) {
      if (forAllItemsList![i].receiver!.name == name) {
        forAllItemsList![i].hide = true;
      }
    }
  }

  void hide1(String name, String? receiverName) {
    if (receiverName == null || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        if (forAllItemsList![i].receiver!.name == name) {
          forAllItemsList![i].hide = true;
        }
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver receiver = keys[i];
        if (receiver.name == receiverName) {
          List<ListItem>? items = receiverListItems![receiver];
          for (int j = 0; j < items!.length; j++) {
            if (items[j].receiver!.name == name) {
              receiverListItems![receiver]![j].hide = true;
            }
          }
          break;
        }
      }
    }
  }

  void hideAll(Receiver? receiver) {
    if (receiver == null) {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList![i].hide = true;
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver temp = keys[i];
        if (temp.name == receiver.name) {
          List<ListItem>? items = receiverListItems![temp];
          for (int j = 0; j < items!.length; j++) {
            receiverListItems![temp]![j].hide = true;
          }
        }
      }
    }
  }

  void hideAll1(String? receiverName) {
    if (receiverName == null || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList![i].hide = true;
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver receiver = keys[i];
        if (receiverName == receiver.name) {
          List<ListItem>? items = receiverListItems![receiver];
          for (int j = 0; j < items!.length; j++) {
            receiverListItems![receiver]![j].hide = true;
          }
          break;
        }
      }
    }
  }

  void show(String name) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      Receiver receiver = keys[i];
      List<ListItem>? list = receiverListItems![receiver];
      for (int j = 0; j < list!.length; j++) {
        if (list[j].receiver!.name == name) {
          receiverListItems![receiver]![j].hide = false;
        }
      }
    }
    for (int i = 0; i < forAllItemsList!.length; i++) {
      forAllItemsList![i].hide = false;
    }
  }

  void show1(String name, Receiver? receiver) {
    if (receiver == null) {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList![i].hide = false;
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver temp = keys[i];
        if (receiver.name == temp.name) {
          List<ListItem>? items = receiverListItems![temp];
          for (int j = 0; j < items!.length; j++) {
            if (items[j].receiver!.name == receiver.name) {
              receiverListItems![receiver]![j].hide = false;
            }
          }
          break;
        }
      }
    }
  }

  void show2(String name, String? receiverName) {
    if (receiverName == null || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        if (forAllItemsList![i].receiver!.name == name) {
          forAllItemsList![i].hide = false;
        }
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver receiver = keys[i];
        if (receiver.name == receiverName) {
          List<ListItem>? items = receiverListItems![receiver];
          for (int j = 0; j < items!.length; j++) {
            if (items[j].receiver!.name == name) {
              receiverListItems![receiver]![j].hide = false;
            }
          }
          break;
        }
      }
    }
  }

  void showAll(Receiver? receiver) {
    if (receiver == null) {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList![i].hide = false;
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver temp = keys[i];
        if (receiver.name == temp.name) {
          List<ListItem>? items = receiverListItems![temp];
          for (int j = 0; j < items!.length; j++) {
            receiverListItems![receiver]![j].hide = false;
          }
          break;
        }
      }
    }
  }

  void showAll1(String? receiverName) {
    if (receiverName == null || receiverName == '') {
      for (int i = 0; i < forAllItemsList!.length; i++) {
        forAllItemsList![i].hide = false;
      }
    } else {
      final keys = receiverListItems!.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        Receiver receiver = keys[i];
        if (receiver.name == receiverName) {
          List<ListItem>? items = receiverListItems![receiver];
          for (int j = 0; j < items!.length; j++) {
            receiverListItems![receiver]![j].hide = false;
          }
          break;
        }
      }
    }
  }

  void addReceiver(Receiver receiver) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiver.name && temp.runtimeType == TempReceiver) {
        Receiver listReceiver = receiver;
        if (listReceiver.status == 'new') {
          receiverListItems!.putIfAbsent(listReceiver, () => forAllItemsList!);
        } else {
          receiverListItems!.putIfAbsent(listReceiver, () => []);
        }
      }
    }
  }

  void removeReceiver(Receiver receiver) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].runtimeType == ListReceiver &&
          receiver.name == keys[i].name) {
        if (currentReceiver == receiver) {
          currentReceiver = keys[i + 1];
        }
        receiverListItems!.remove(receiver);
      }
    }
  }

  void selectReceiver(String receiverName) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      Receiver receiver = keys[i];
      if (receiver.name == receiverName) {
        currentReceiver!.name = keys[i].name;
        currentReceiver!.icon = keys[i].icon;
        currentReceiver!.statusMenuItems = keys[i].statusMenuItems;
        break;
      }
    }
    log('Not found');
  }

  void selectReceiver1(Receiver receiver) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      Receiver temp = keys[i];
      if (temp.name == receiver.name) {
        currentReceiver!.name = temp.name;
        currentReceiver!.icon = temp.icon;
        currentReceiver!.statusMenuItems = temp.statusMenuItems;
        break;
      }
    }
    log('Not found');
  }

  String? getStatus(String receiverName) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      Receiver receiver = keys[i];
      if (receiver.name == receiverName) {
        return receiver.status;
      }
    }
    return null;
  }

  String? getStatus1(Receiver receiver) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      Receiver temp = keys[i];
      if (receiver.name == temp.name) {
        return temp.status;
      }
    }
    return null;
  }

  void removeReceiver1(String receiverName) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiverName) {
        receiverListItems!.remove(temp);
        if (temp == currentReceiver) {
          currentReceiver = keys[i + 1];
        }
        if (receiverListItems!.keys.toList().isEmpty) {
          final controller = Get.find<HomeController>();
          controller.mainButton = generalMainButton!.text;
          controller.status = generalStatus!;
        }
      }
      break;
    }
  }

  void removeAllReceivers() {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      receiverListItems!.remove(keys[i]);
    }
  }

  Duration? setStatus(Receiver receiver, String status) {
    bool found = false;
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiver.name) {
        List<ListItem>? items = receiverListItems!.remove(keys[i]);
        keys[i].status = status;
        receiverListItems!.remove(keys[i]);
        receiverListItems!.putIfAbsent(keys[i], () => items!);
        if (status.contains('{')) {
          int index = status.indexOf('{');
          int lastIndex = status.indexOf('}');
          final time = status.substring(index + 1, lastIndex);
          int? milliseconds = int.tryParse(time);
          if (milliseconds != null) {
            return Duration(milliseconds: milliseconds);
          } else {
            log('Milliseconds are null');
          }
        }
        found = true;
        break;
      }
    }
    if (!found) {
      receiver = TempReceiver(name: receiver.name!);
    }
    return null;
  }

  Duration? setStatus1(String receiverName, String status) {
    bool found = false;
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiverName) {
        List<ListItem>? items = receiverListItems!.remove(keys[i]);
        keys[i].status = status;
        receiverListItems!.remove(keys[i]);
        receiverListItems!.putIfAbsent(keys[i], () => items!);
        if (status.contains('{')) {
          int index = status.indexOf('{');
          int lastIndex = status.indexOf('}');
          final time = status.substring(index + 1, lastIndex);
          int? milliseconds = int.tryParse(time);
          if (milliseconds != null) {
            return Duration(milliseconds: milliseconds);
          } else {
            log('Milliseconds are null');
          }
        }
        found = true;
        break;
      }
    }
    if (!found) {
      TempReceiver receiver = TempReceiver(name: receiverName);
      receiverListItems![receiver] = forAllItemsList!;
    }
    return null;
  }

  void setMainButton(Receiver receiver, {MainButton? mainButton}) {
    bool found = false;
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiver.name) {
        found = true;
        if (mainButton != null) {
          MainButtonList buttonList = MainButtonList(
            mainButton: mainButton,
            disabled: false,
          );
          keys[i].button = buttonList;
          final items = receiverListItems![keys[i]];
          receiverListItems!.remove(keys[i]);
          receiverListItems!.putIfAbsent(keys[i], () => items!);
        } else {
          MainButtonList buttonList = MainButtonList(
            mainButton: null,
            disabled: true,
          );
          keys[i].button = buttonList;
          final items = receiverListItems![keys[i]];
          receiverListItems!.remove(keys[i]);
          receiverListItems!.putIfAbsent(keys[i], () => items!);
        }
        break;
      }
    }
    if (!found) {
      TempReceiver tempReceiver = TempReceiver(name: receiver.name!);
      receiverListItems![tempReceiver] = forAllItemsList!;
    }
  }

  MainButton? getMainButton(String receiverName) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiverName) {
        return keys[i].button!.mainButton!;
      }
    }
    return null;
  }

  void disableMainButton(Receiver receiver) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiver.name) {
        keys[i].button!.disabled = true;
      }
    }
  }

  void disableMainButton1(String receiverName) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiverName) {
        keys[i].button!.disabled = true;
      }
    }
  }

  void addStatusMenuItem(Receiver receiver, StatusMenuItem item) {
    bool receiverFound = false;
    bool itemFound = false;
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiver.name) {
        receiverFound = true;
        List<StatusMenuItem>? items = keys[i].statusMenuItems;
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == item.name && items[j].id == item.id) {
            itemFound = true;
            items[j].message = item.message;
            items[j].time = item.time;
            keys[i].statusMenuItems![j] = items[j];
            final listItems = receiverListItems![keys[i]];
            receiverListItems!.remove(keys[i]);
            receiverListItems!.putIfAbsent(keys[i], () => listItems!);
          }
          if (!itemFound) {
            StatusMenuItemList list = StatusMenuItemList(
              item: item,
            );
            keys[i].statusMenuItems!.add(list.item!);
            final listItems = receiverListItems![keys[i]];
            receiverListItems!.remove(keys[i]);
            receiverListItems!.putIfAbsent(keys[i], () => listItems!);
          }
        }
      }
    }
    if (!receiverFound) {
      TempReceiver tempReceiver = TempReceiver(name: receiver.name!);
      receiverListItems![tempReceiver] = forAllItemsList!;
    }
  }

  void addStatusMenuItem1(String receiverName, StatusMenuItem item) {
    bool receiverFound = false;
    bool itemFound = false;
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiverName) {
        receiverFound = true;
        List<StatusMenuItem>? items = keys[i].statusMenuItems;
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == item.name && items[j].id == item.id) {
            itemFound = true;
            items[j].message = item.message;
            items[j].time = item.time;
            keys[i].statusMenuItems![j] = items[j];
            final listItems = receiverListItems![keys[i]];
            receiverListItems!.remove(keys[i]);
            receiverListItems!.putIfAbsent(keys[i], () => listItems!);
          }
          if (!itemFound) {
            StatusMenuItemList list = StatusMenuItemList(
              item: item,
            );
            keys[i].statusMenuItems!.add(list.item!);
            final listItems = receiverListItems![keys[i]];
            receiverListItems!.remove(keys[i]);
            receiverListItems!.putIfAbsent(keys[i], () => listItems!);
          }
        }
      }
    }
    if (!receiverFound) {
      TempReceiver tempReceiver = TempReceiver(name: receiverName);
      receiverListItems![tempReceiver] = forAllItemsList!;
    }
  }

  void removeStatusMenuItem(Receiver receiver, int id) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiver.name) {
        List<StatusMenuItem>? items = keys[i].statusMenuItems;
        for (int j = 0; j < items!.length; j++) {
          if (items[j].id == id) {
            items.removeAt(j);
            keys[i].statusMenuItems = items;
            final list = receiverListItems![keys[i]];
            receiverListItems!.remove(keys[i]);
            receiverListItems!.putIfAbsent(keys[i], () => list!);
          }
        }
      }
    }
  }

  void removeStatusMenuItem1(String receiverName, int id) {
    final keys = receiverListItems!.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiverName) {
        List<StatusMenuItem>? items = keys[i].statusMenuItems;
        for (int j = 0; j < items!.length; j++) {
          if (items[j].id == id) {
            items.removeAt(j);
            keys[i].statusMenuItems = items;
            final list = receiverListItems![keys[i]];
            receiverListItems!.remove(keys[i]);
            receiverListItems!.putIfAbsent(keys[i], () => list!);
          }
        }
      }
    }
  }

  void log(String s) {
    dev.log(
      s,
      time: DateTime.now(),
    );
  }
}
