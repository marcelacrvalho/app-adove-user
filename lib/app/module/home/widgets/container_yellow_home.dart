import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerYellowHomeWidget extends StatelessWidget {
  const ContainerYellowHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade700,
      width: double.infinity,
      height: Get.mediaQuery.size.height * 0.50,
    );
  }
}
