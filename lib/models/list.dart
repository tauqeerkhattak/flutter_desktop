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
  Map<Receiver, List<ListItem>>? receiverListItems;
  Receiver? currentReceiver;

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
        forAllItemsList!.removeAt(i);
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
      forAllItemsList!.removeAt(i);
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

  // void addReceiver(Receiver receiver) {
  //   final keys = receiverListItems!.keys.toList();
  //   for (int i = 0; i < keys.length; i++) {
  //     final temp = keys[i];
  //     if (temp.name == receiver.name && temp.runtimeType == TempReceiver) {
  //       Receiver tempReceiver = Receiver();
  //     }
  //   }
  // }

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

  void log(String s) {}
}
