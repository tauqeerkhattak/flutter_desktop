import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/status_menu_item.dart';

class StatusMenuItemList {
  StatusMenuItem? item;
  $List? owner;
  Receiver? receiver;

  StatusMenuItemList({
    this.owner,
    this.receiver,
    this.item,
  });

  void setOwner($List owner) {
    this.owner = owner;
  }

  void setReceiver(Receiver receiver) {
    this.receiver = receiver;
  }

  $List? getOwner() {
    return owner;
  }

  Receiver? getReceiver() {
    if (item?.type == Type.video) {
      return receiver;
    } else {
      return receiver;
    }
  }
}
