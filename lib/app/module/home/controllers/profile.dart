import 'package:adove/app/data/repositories/user.dart';
import 'package:adove/app/global/widgets/snackbar/snack.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();
  final repository = Get.find<UserRepository>();

  TextEditingController controllerLocation = TextEditingController();
  TextEditingController controllerStreet = TextEditingController();
  TextEditingController controllerNeighborhood = TextEditingController();
  TextEditingController controllerNumber = TextEditingController();

  Future updateAddres() async {
    repository.updateAddress(
        AuthController.to.currentUser.value.id!,
        controllerLocation.text,
        controllerStreet.text,
        controllerNeighborhood.text,
        controllerNumber.text);
    SnarckBarWidget.showSnack(
        'Tudo certo', 'Seu endereço foi atualizado com sucesso!');
  }
}
