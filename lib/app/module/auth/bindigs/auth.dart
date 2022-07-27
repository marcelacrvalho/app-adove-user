import 'package:adove/app/data/repositories/user.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => UserRepository());
  }
}
