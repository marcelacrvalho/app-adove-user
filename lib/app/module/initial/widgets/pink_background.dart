import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinkBackgroundInitialWidget extends StatelessWidget {
  const PinkBackgroundInitialWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.mediaQuery.size.height * 0.5,
          width: double.infinity,
          color: appThemeData.primaryColor,
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: Get.mediaQuery.size.height * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: Get.mediaQuery.size.height * 0.12,
                  child: _titleRow()),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
