import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final num? fontSize;
  final FontWeight? weight;
  final Color? textColor;
  final TextAlign? textAlign;
  final String? fontFamily;
  final double? lineHeight;

  const TitleText({
    Key? key,
    this.text,
    this.fontSize,
    this.weight,
    this.textColor,
    this.textAlign,
    this.fontFamily,
    this.lineHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: fontFamily == 'Roboto'
          ? GoogleFonts.roboto(
              fontSize: fontSize?.toDouble(),
              fontWeight: weight,
              color: textColor,
              height: lineHeight,
            )
          : TextStyle(
              height: lineHeight,
              fontFamily: fontFamily,
              fontSize: fontSize?.toDouble(),
              fontWeight: weight,
              color: textColor,
            ),
    );
  }
}
