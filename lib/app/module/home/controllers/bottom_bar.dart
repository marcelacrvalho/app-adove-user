import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/module/home/views/home.dart';
import 'package:adove/app/module/home/views/profile.dart';
import 'package:adove/app/module/home/views/schedule.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  static BottomBarController get to => Get.find();

  int index = 1;
  final List pages = const [
    ScheduleView(),
    HomeView(),
    ProfileView(),
  ];

  final List labelColor = [
    kPurpleDark,
    appThemeData.primaryColor,
    kBlue,
  ];

  var currentColor = appThemeData.primaryColor;
}
