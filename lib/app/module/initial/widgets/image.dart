import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageInitialWidget extends StatelessWidget {
  final String path;

  const ImageInitialWidget({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.mediaQuery.size.height * 0.8,
      child: Image.asset(path),
    );
  }
}
