import 'package:adove/app/global/widgets/text/text.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {

  final void Function() onTap;
  final double height;
  final double width;
  final String buttonText;
  final double fontSize;
  final bool isCenterText;
  final Color fontColor;
  final Color buttonColor;
  final bool isBoldButtonText;
  final String fontFamily;

  const ElevatedButtonWidget({Key? key, 
    required this.onTap,
    required this.height,
    required this.buttonText,
    required this.fontSize,
    required this.buttonColor,
    this.isCenterText = true,
    this.fontColor = Colors.white,
    this.width = double.infinity,
    this.isBoldButtonText = false,
    this.fontFamily = 'Myriad',
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
        color: buttonColor,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: buttonText,
                fontSize: fontSize,
                isCenter: isCenterText,
                isBold: isBoldButtonText,
                fontColor: fontColor,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}