import 'package:fluent_ui/fluent_ui.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final num? fontSize;
  final FontWeight? weight;
  final Color? textColor;
  final TextAlign? textAlign;

  const TitleText({
    Key? key,
    this.text,
    this.fontSize,
    this.weight,
    this.textColor,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize!.toDouble(),
        fontWeight: weight,
        color: textColor,
      ),
    );
  }
}
