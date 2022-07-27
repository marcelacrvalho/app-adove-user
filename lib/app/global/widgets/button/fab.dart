import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  final IconData buttonIcon;

  const FloatingActionButtonWidget({
    Key? key,
    required this.onPressed,
    required this.buttonIcon,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: Get.mediaQuery.size.width * 0.18,
        height: Get.mediaQuery.size.height * 0.1,
        child: Icon(buttonIcon,
            color: appThemeData.primaryColor,
            size: Get.mediaQuery.size.width * 0.08),
      ),
    );
  }
}
