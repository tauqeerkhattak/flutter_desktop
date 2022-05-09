import 'dart:developer';

import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/main_button.dart';
import 'package:flutter_desktop/models/receiver.dart';

class MainButtonList {
  $List? owner;
  Receiver? receiver;
  MainButton? mainButton;
  bool? disabled = false;

  MainButtonList({
    this.owner,
    this.receiver,
    this.mainButton,
    this.disabled,
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

  void onClick() {
    log("On Tap");
    mainButton?.onClick(
      owner: owner,
      forReceiver: receiver,
    );
  }
}
