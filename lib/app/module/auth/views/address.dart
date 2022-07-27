
import 'package:adove/app/global/helpers/cities.dart';
import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/button/elevated.dart';
import 'package:adove/app/global/widgets/text/header.dart';
import 'package:adove/app/global/widgets/text/input.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderTextWidget(),
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  text: 'Alguns profissionais vão até você',
                  fontSize: kH2,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  text: 'Por isso, preciso saber onde você mora',
                  fontSize: kH2,
                  fontColor: Colors.grey,
                ),
              ),
              const Divider(),
              _formCity(),
              const Divider(),
              FormTextWidget(
                hinText: 'Agora, o nome da rua',
                controller: AuthController.to.controllerStreetRegister,
              ),
              const Divider(),
              FormTextWidget(
                hinText: 'Qual é o bairro?',
                controller: AuthController.to.controllerNeighborhoodRegister,
              ),
              const Divider(),
              FormTextWidget(
                hinText: 'Por último, o número',
                controller: AuthController.to.controllerNumberRegister,
              ),
              const Divider(),
              Obx(
                () => Visibility(
                  visible: AuthController.to.visibleButton.value,
                  child: ElevatedButtonWidget(
                    onTap: AuthController.to.registerUser,
                    height: kBigButton,
                    buttonText: 'Prontinho',
                    fontSize: kH2,
                    buttonColor: appThemeData.primaryColor,
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !AuthController.to.visibleButton.value,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formCity() {
    return SearchField(
      suggestions: Cities.listCities,
        controller:  AuthController.to.controllerLocationRegister,
        maxSuggestionsInViewPort: 3,
        marginColor: Colors.white,
        suggestionStyle: TextStyle(
          fontSize: kH2,
        ),
        searchStyle: TextStyle(
          fontSize: kH2,
        ),
        searchInputDecoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
          labelStyle: TextStyle(
            fontSize: kH2,
          ),
          hintText: 'Onde você está?',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: kH2,
          ),
        ),
      );
  }
}
