import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnarckBarWidget {
  static showSnack(String title, String content) {
    Get.snackbar(
      title, 
      content,
        margin: EdgeInsets.only(
          top: Get.mediaQuery.size.height * 0.03,
          left: 4.0,
          right: 4.0,
        ),
        borderRadius: 7.0,
        barBlur: 4.0,
        );
  }
}
