import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/receiver.dart';

class ListItem {
  $List? owner;
  Receiver? receiver;
  JSONItem? item;
  bool? disable;
  bool? hide;

  ListItem({
    this.owner,
    this.receiver,
    this.item,
    this.disable,
    this.hide,
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
    return receiver;
  }

  void onDoubleClick() {
    item?.onDoubleClick(this, owner!, receiver!);
  }
}
