import 'package:flutter_desktop/models/clients_item.dart';
import 'package:flutter_desktop/models/effects_item.dart';
import 'package:flutter_desktop/models/list.dart';
import 'package:flutter_desktop/models/list_item.dart';
import 'package:flutter_desktop/models/main_button.dart';
import 'package:flutter_desktop/models/message_status_menu_item.dart';
import 'package:flutter_desktop/models/receiver.dart';
import 'package:flutter_desktop/models/steps_item.dart';
import 'package:flutter_desktop/models/video_status_menu_item.dart';

class Data {
  static $List l = $List(
    name: 'The List',
    text: 'List',
    icon: 'assets/icons/camcorder.png',
  );

  static Receiver glsR = Receiver(
    name: 'glsR',
    text: 'gls Receiver',
    icon: 'assets/icons/aim.png',
  );
  static Receiver mR = Receiver(
    name: 'mR',
    text: 'm Receiver',
    icon: 'assets/icons/bin.png',
  );

  static MainButton mRmb = MainButton(text: 'mR Button');

  static VideoStatusMenuItem mrVsi = VideoStatusMenuItem(
    id: 123,
    name: 'mr_vsi',
    time: 150012,
    timer_down: false,
  );
  static VideoStatusMenuItem mrVsi2 = VideoStatusMenuItem(
    id: 124,
    name: 'mr_vsi2',
    time: 1523412,
    timer_down: true,
  );
  static MessageStatusMenuItem mrMsi = MessageStatusMenuItem(
    id: 125,
    name: 'mr_msi',
    time: 150012512,
    timer_down: false,
  );

  static ClientItem ci1 = ClientItem(
    name: 'ci1',
    text: 'Item Kill',
    icon: 'assets/icons/linux.png',
  );
  static EffectsItem ci2 = EffectsItem(
    name: 'ci2',
    text: 'Item music',
    icon: 'assets/icons/tv.png',
  );
  static StepsItem ci3 = StepsItem(
    name: 'ci3',
    text: 'Item video',
    icon: null,
  );
  static StepsItem ci4 = StepsItem(
    name: 'ci4',
    text: 'Item photo',
    icon: null,
  );

  static void initialize() {
    l.receiverListItems = <Receiver, List<ListItem>>{};
    l.forAllItemsList = [];
    l.receiverListItems!.addAll({glsR: []});
    l.receiverListItems!.addAll({mR: []});
    ci1.for_ = ['glsR', 'mR'];
    ci2.for_ = null;
    ci4.for_ = ['glsR'];
    ci3.for_ = [];

    ci1.file = 'c:\\moon.jpg';
    ci2.file = 'c:\\moon.mp3';
    ci3.actions = ['x', 'z'];
    ci4.actions = ['x', 'z'];

    l.add(ci4);
    l.addReceiver(mR);
    l.addReceiver(glsR);
    l.add(ci2);
    l.add(ci1);
    l.add(ci3);

    l.disable1('ci4', 'mR');
    l.remove('ci2');
    l.remove2('ci1', null);

    l.selectReceiver('mR');

    l.setStatus(mR, 'Hi All');

    l.addStatusMenuItem(mR, mrVsi);
    mrVsi.time = 100;
    mrVsi.timerDown = true;
    l.addStatusMenuItem(mR, mrVsi);

    l.removeStatusMenuItem(mR, mrVsi.id!);

    l.setStatus1('mR', 'end');
    l.setMainButton(
      mR,
      mainButton: mRmb,
    );

    l.removeReceiver1('xx');
    l.removeReceiver1('mR');
  }
}
