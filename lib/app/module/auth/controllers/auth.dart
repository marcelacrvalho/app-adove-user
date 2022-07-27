import 'package:adove/app/data/graphql/mutations.dart';
import 'package:adove/app/data/graphql/server.dart';
import 'package:adove/app/data/models/push_notification_firebase.dart';
import 'package:adove/app/data/models/user.dart';
import 'package:adove/app/data/repositories/user.dart';
import 'package:adove/app/global/widgets/snackbar/snack.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/routes/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql/client.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final userRepository = Get.find<UserRepository>();

  final box = GetStorage('adove-user-app');
  final GraphQLClient _client = getGraphQLClient();
  RxBool visibleButton = true.obs;
  Rx<User> currentUser = User().obs;

  TextEditingController controllerEmailLogin = TextEditingController();
  TextEditingController controllerPasswordLogin = TextEditingController();

  TextEditingController controllerEmailRegister = TextEditingController();
  TextEditingController controllerPasswordRegister = TextEditingController();
  TextEditingController controllerNameRegister = TextEditingController();
  TextEditingController controllerLocationRegister = TextEditingController();
  TextEditingController controllerStreetRegister = TextEditingController();
  TextEditingController controllerNeighborhoodRegister =
      TextEditingController();
  TextEditingController controllerNumberRegister = TextEditingController();

  void toHomeView() {
    visibleButton.value = !visibleButton.value;
    Get.toNamed(Routes.kBottomBar);
  }

  void toAddressView() {
    Get.toNamed(Routes.kAddress);
  }

  void loginUser() async {
    final MutationOptions options = MutationOptions(
      document: gql(login),
      variables: <String, dynamic>{
        'email': controllerEmailLogin.text,
        'password': controllerPasswordLogin.text,
      },
    );
    final QueryResult result = await _client.mutate(options);
    if (result.data?['loginUser'] != null) {
      final user = User.fromJson(result.data?['loginUser']);
      currentUser.value = user;
      HomeController.to.localizationController.text =
          currentUser.value.location!;
      box.write('auth-user', currentUser.value);
      toHomeView();
    } else {
      SnarckBarWidget.showSnack(
        'Eita, ocorreu um erro',
        'Verifique seus dados e tente novamente',
      );
    }
  }

  void registerUser() async {
    final MutationOptions options = MutationOptions(
      document: gql(createUser),
      variables: <String, dynamic>{
        'name': controllerNameRegister.text,
        'email': controllerEmailRegister.text,
        'password': controllerPasswordRegister.text,
        'location': controllerLocationRegister.text,
        'street': controllerStreetRegister.text,
        'neighborhood': controllerNeighborhoodRegister.text,
        'number': controllerNumberRegister.text
      },
    );
    final QueryResult result = await _client.mutate(options);
    if (controllerNameRegister.text.isNotEmpty &&
        controllerLocationRegister.text.isNotEmpty) {
      if (result.data != null) {
        final user = User.fromJson(result.data!['createUser']);
        currentUser.value = user;
        _saveFirebaseToken();
        box.write('auth-user', currentUser.value);
        HomeController.to.localizationController.text =
            currentUser.value.location!;
        toHomeView();
      }
    } else {
      SnarckBarWidget.showSnack(
        'Eita, ocorreu um erro',
        'Parece que você não preencheu todos os campos',
      );
    }
  }

  void _saveFirebaseToken() async {
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    box.write('adove-user-firebase-token', firebaseToken);
    userRepository.updateFirebaseToken(currentUser.value.id!, firebaseToken!);
  }
}
