import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class IconBackEventWidget extends StatelessWidget {
  const IconBackEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Align(
        alignment: Alignment.topLeft,
        child: Icon(
          LineIcons.arrowLeft,
          size: Get.size.height * 0.035,
          color: appThemeData.primaryColor,
        ),
      ),
    );
  }
}
