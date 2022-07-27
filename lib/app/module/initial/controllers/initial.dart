import 'package:adove/app/data/models/user.dart';
import 'package:adove/app/data/repositories/user.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  final box = GetStorage('adove-user-app');
  final userRepository = Get.find<UserRepository>();

  void verifyStorage() {
    final response = box.read('auth-user');
    if (response != null) {
      User user = User.fromJson(response);
      AuthController.to.currentUser.value = user;
      HomeController.to.localizationController.text =
          AuthController.to.currentUser.value.location!;
      _userNotificationToken();
      Get.toNamed(Routes.kBottomBar);
    } else {
      toAuthView();
    }
  }

  Future _userNotificationToken() async {
    String? firebaseToken = box.read('adove-user-firebase-token');
    String? newToken;

    await Firebase.initializeApp();
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      newToken = fcmToken;
    }).onError((err) {});

    if (firebaseToken == null || firebaseToken != newToken) {
      firebaseToken = await FirebaseMessaging.instance.getToken();
      box.write('adove-user-firebase-token', newToken);
      userRepository.updateFirebaseToken(
          AuthController.to.currentUser.value.id!, newToken!);
    }
  }

  void toAuthView() {
    Get.toNamed(Routes.kAuth);
  }
}
