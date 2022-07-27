import 'package:adove/app/data/repositories/job.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:get/get.dart';

class JobBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobController());
    Get.lazyPut(() => JobRepository());
  }
}