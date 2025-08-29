import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MyText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontStyle? fontStyle;
  final VoidCallback? onTap;
  List<Shadow>? shadow;
  final int? maxLines;
  final Paint? paint;
  final double? size;
  final double? lineHeight;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final double? letterSpacing;
  final TextStyle? textStyle;

  MyText({
    super.key,
    required this.text,
    this.size,
    this.lineHeight,
    this.maxLines = 100,
    this.decoration = TextDecoration.none,
    this.color ,
    this.paint,
    this.letterSpacing,
    this.fontWeight = FontWeight.w400,
    this.textAlign,
    this.textOverflow,
    this.fontFamily,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.onTap,
    this.shadow,
    this.fontStyle,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle ?? TextStyle(
          foreground: paint,
          shadows: shadow,
          fontSize: size ?? 15,
          color: color ?? Colors.black,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationColor: color,
          decorationThickness: 2,
          fontFamily: fontFamily ?? "Poppins",
          height: lineHeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing ?? 0.2,
        ),
        textAlign: textAlign ?? TextAlign.start, // ✅ ADD DEFAULT HERE
        // textDirection: TextDirection.ltr,
        maxLines: maxLines,
        overflow: textOverflow,
      ),
    );
  }
}
