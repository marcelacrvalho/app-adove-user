import 'package:adove/app/data/repositories/event.dart';
import 'package:adove/app/data/repositories/hour.dart';
import 'package:adove/app/module/home/controllers/schedule.dart';
import 'package:get/get.dart';

class ScheduleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
    Get.lazyPut(() => EventRepository());
  }
}
