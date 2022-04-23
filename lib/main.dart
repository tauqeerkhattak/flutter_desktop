import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/screens/home/home.dart';

void main() {
  runApp(const FlutterDesktop());
}

class FlutterDesktop extends StatelessWidget {
  const FlutterDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
