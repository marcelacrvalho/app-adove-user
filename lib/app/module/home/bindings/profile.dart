import 'package:adove/app/data/repositories/user.dart';
import 'package:adove/app/module/home/controllers/profile.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => UserRepository());
  }
}
