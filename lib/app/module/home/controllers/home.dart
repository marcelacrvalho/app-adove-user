import 'package:adove/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();
  final RxString currentCategory = ''.obs;
  final localizationController = TextEditingController();

  void onTapCategoryCard(String category) {
    currentCategory.value = category;
    _toJobsView();
  }

  void _toJobsView() async {
    Get.toNamed(Routes.kJob);
  }
}
