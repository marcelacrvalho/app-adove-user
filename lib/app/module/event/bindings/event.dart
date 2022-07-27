import 'package:adove/app/data/repositories/event.dart';
import 'package:adove/app/data/repositories/hour.dart';
import 'package:adove/app/module/event/controllers/event.dart';
import 'package:get/get.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventController());
    Get.lazyPut(() => HourRepository());
    Get.lazyPut(() => EventRepository());
  }
}