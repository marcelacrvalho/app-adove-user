import 'package:adove/app/data/repositories/job.dart';
import 'package:adove/app/data/repositories/user.dart';
import 'package:adove/app/data/repositories/event.dart';
import 'package:adove/app/module/home/controllers/bottom_bar.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/module/home/controllers/profile.dart';
import 'package:adove/app/module/home/controllers/schedule.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:get/get.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ScheduleController());
    Get.lazyPut(() => HomeController());
    Get.create(() => EventRepository());
    Get.create(() => UserRepository());
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => JobController());
    Get.lazyPut(() => JobRepository());
  }
}
