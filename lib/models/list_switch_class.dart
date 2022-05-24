import 'package:flutter_desktop/controllers/list_switch_controller.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/status_switch_items.dart';
import 'package:get/get.dart';

class ListSwitchClass {
  Map<Receiver, List<StatusSwitchItem>>? statusSwitchItems;
  int currentReceiverIndex = 0;
  final controller = Get.find<ListSwitchController>();

  void scrollForward() {
    final length = statusSwitchItems!.keys.length;
    if (currentReceiverIndex != length - 1) {
      currentReceiverIndex++;
      controller.scrollController.scrollToIndex(currentReceiverIndex);
    }
  }

  void scrollBackward() {
    if (currentReceiverIndex != 0) {
      currentReceiverIndex--;
      controller.scrollController.scrollToIndex(currentReceiverIndex);
    } else if (currentReceiverIndex == 0) {
      controller.scrollController.scrollToIndex(currentReceiverIndex);
    }
  }

  void scrollTo(String receiverName) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiverName) {
        controller.scrollController.scrollToIndex(i);
      }
    }
  }

  void scrollTo1(Receiver receiver) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiver.name) {
        controller.scrollController.scrollToIndex(i);
      }
    }
  }

  void addReceiver(Receiver receiver) {
    final keys = getAllReceivers();
    if (!keys.contains(receiver)) {
      statusSwitchItems!.assign(receiver, []);
    }
  }

  void removeReceiver(Receiver receiver) {
    final keys = getAllReceivers();
    if (keys.contains(receiver)) {
      int index = keys.indexOf(receiver);
      statusSwitchItems!.remove(keys[index]);
    }
  }

  void addStatusSwitchItem(Receiver receiver, StatusSwitchItem item) {
    final keys = getAllReceivers();
    bool found = false;
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiver.name) {
        found = true;
        final items = statusSwitchItems![keys[i]];
        if (items!.contains(item)) {
          int index = items.indexOf(item);
          statusSwitchItems![keys[i]]![index].status = item.status;
        } else {
          statusSwitchItems![keys[i]]!.add(item);
        }
      }
    }
    if (!found) {
      statusSwitchItems!.assign(receiver, [item]);
    }
  }

  bool addStatusSwitchItem1(String receiverName, StatusSwitchItem item) {
    final keys = getAllReceivers();
    bool found = false;
    for (int i = 0; i < keys.length; i++) {
      if (keys[i].name == receiverName) {
        found = true;
        final items = statusSwitchItems![keys[i]];
        if (items!.contains(item)) {
          int index = items.indexOf(item);
          statusSwitchItems![keys[i]]![index].status = item.status;
        } else {
          statusSwitchItems![keys[i]]!.add(item);
        }
        return true;
      }
    }
    if (!found) {
      return false;
    }
    return found;
  }

  void addStatusSwitchItems(Receiver receiver, List<StatusSwitchItem> items) {
    for (int i = 0; i < items.length; i++) {
      addStatusSwitchItem(receiver, items[i]);
    }
  }

  void addStatusSwitchItems1(
      String receiverName, List<StatusSwitchItem> items) {
    for (int i = 0; i < items.length; i++) {
      addStatusSwitchItem1(receiverName, items[i]);
    }
  }

  void setStatusSwitchItem(
      Receiver receiver, String switchName, Status status) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiver.name) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == switchName) {
            statusSwitchItems![temp]![j].status = status;
          }
        }
      }
    }
  }

  void setStatusSwitchItemStatus(
      String receiverName, String switchName, Status status) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiverName) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == switchName) {
            statusSwitchItems![temp]![j].status = status;
          }
        }
      }
    }
  }

  void removeStatusSwitchItem(Receiver receiver, String switchName) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiver.name) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == switchName) {
            statusSwitchItems![temp]!.removeAt(j);
          }
        }
      }
    }
  }

  void removeStatusSwitchItem1(String receiverName, String switchName) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiverName) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == switchName) {
            statusSwitchItems![temp]!.removeAt(j);
          }
        }
      }
    }
  }

  void removeStatusSwitchItems(Receiver receiver, List<String> switches) {
    for (int i = 0; i < switches.length; i++) {
      removeStatusSwitchItem(receiver, switches[i]);
    }
  }

  void removeStatusSwitchItems1(String receiverName, List<String> switches) {
    for (int i = 0; i < switches.length; i++) {
      removeStatusSwitchItem1(receiverName, switches[i]);
    }
  }

  void removeAll(Receiver receiver) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiver.name) {
        statusSwitchItems![temp] = [];
      }
    }
  }

  void removeAll1(String receiverName) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiverName) {
        statusSwitchItems![temp] = [];
      }
    }
  }

  void disableStatusSwitchItem(Receiver receiver, String switchName) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiver.name) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == switchName) {
            statusSwitchItems![temp]![j].status = Status.off;
          }
        }
      }
    }
  }

  void disableStatusSwitchItem1(String receiverName, String switchName) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiverName) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          if (items[j].name == switchName) {
            statusSwitchItems![temp]![j].status = Status.off;
          }
        }
      }
    }
  }

  void disableStatusSwitchItems(Receiver receiver, List<String> switches) {
    for (int i = 0; i < switches.length; i++) {
      disableStatusSwitchItem(receiver, switches[i]);
    }
  }

  void disableStatusSwitchItems1(String receiverName, List<String> switches) {
    for (int i = 0; i < switches.length; i++) {
      disableStatusSwitchItem1(receiverName, switches[i]);
    }
  }

  void disableAll(Receiver receiver) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiver.name) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          statusSwitchItems![temp]![j].status = Status.off;
        }
      }
    }
  }

  void disableAll1(String receiverName) {
    final keys = getAllReceivers();
    for (int i = 0; i < keys.length; i++) {
      final temp = keys[i];
      if (temp.name == receiverName) {
        final items = statusSwitchItems![temp];
        for (int j = 0; j < items!.length; j++) {
          statusSwitchItems![temp]![j].status = Status.off;
        }
      }
    }
  }

  List<Receiver> getAllReceivers() {
    return statusSwitchItems!.keys.toList();
  }
}
