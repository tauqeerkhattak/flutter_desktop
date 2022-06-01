import 'package:flutter_desktop/models/json_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/list_receiver.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/utils/constants.dart';

class Dummy {
  static $List dummyList = $List();
  static Receiver? currentReceiver;

  Dummy() {
    dummyList.forAllItemsList = List.generate(8, (index) {
      return ListItem(
        owner: dummyList,
        receiver: ListReceiver(),
        item: JSONItem(
          name: 'Name of the Action # $index',
          icon: Constants.icons[index % 5],
          type: Type.STEPS,
        ),
      );
    });
  }
}
