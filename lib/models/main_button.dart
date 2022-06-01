import 'dart:developer';

import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/main_button_list.dart';
import 'package:flutter_desktop/models/receiver.dart';

class MainButton {
  String? text;

  MainButton({
    this.text,
  });

  void onClick({MainButtonList? button, $List? owner, Receiver? forReceiver}) {
    log('Main Button pressed');
  }
}
