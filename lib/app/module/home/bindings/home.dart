import 'package:adove/app/data/repositories/job.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => JobController());
    Get.lazyPut(() => JobRepository());
  }
}
