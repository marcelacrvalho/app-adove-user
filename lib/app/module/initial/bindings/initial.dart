import 'package:adove/app/data/repositories/user.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/module/initial/controllers/initial.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => UserRepository());
  }
}
