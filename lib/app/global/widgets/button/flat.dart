import 'package:adove/app/global/widgets/text/text.dart';
import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {

  final String buttonText;
  final void Function() onTap;
  final double fontSize;
  final bool isCenterText;

  const FlatButtonWidget({Key? key, 
    required this.onTap,
    required this.buttonText,
    required this.fontSize,
    this.isCenterText = false,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextWidget(
        text: buttonText,
        fontSize: fontSize,
        isCenter: isCenterText,
      ),
    );
  }
}