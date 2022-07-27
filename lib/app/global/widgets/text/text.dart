import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final bool isCenter;
  final double fontSize;
  final bool isBold;
  final String fontFamily;
  final Color fontColor;

  const TextWidget({Key? key, 
    required this.text,
    required this.fontSize,
    this.isCenter = false,
    this.isBold = false,
    this.fontFamily = 'Myriad',
    this.fontColor = Colors.black,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCenter ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: fontFamily,
      ),
    );
  }
}
