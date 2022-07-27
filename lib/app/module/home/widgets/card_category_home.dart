import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/button/elevated.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardCategoryHomeWidget extends StatelessWidget {
  final String category;
  final void Function() onTap;

  const CardCategoryHomeWidget({Key? key, required this.category, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.white70,
      child: Tooltip(
        message: category,
        child: ElevatedButtonWidget(
          buttonText: category.toLowerCase(),
          onTap: onTap,
          height: Get.mediaQuery.size.height * 0.02,
          fontSize: kH2,
          buttonColor: appThemeData.scaffoldBackgroundColor,
          width: Get.mediaQuery.size.width * 0.35,
          fontColor: appThemeData.primaryColor,
        ),
      ),
    );
  }
}
