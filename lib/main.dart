import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/screens/home/home.dart';
import 'package:flutter_desktop/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.setWindow();
  runApp(const FlutterDesktop());
}

class FlutterDesktop extends StatelessWidget {
  const FlutterDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
