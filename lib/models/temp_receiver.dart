import 'package:flutter_desktop/models/receiver.dart';

class TempReceiver extends Receiver {
  TempReceiver({required String name}) : super(name: name);

  @override
  bool? ghost = true;
}
