import 'package:adove/app/global/helpers/cities.dart';
import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/button/elevated.dart';
import 'package:adove/app/global/widgets/text/input.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/module/home/controllers/profile.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                    text: 'Olá ${AuthController.to.currentUser.value.name},',
                    fontSize: kH2,
                    isCenter: false,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                    text: 'Atualize suas informações',
                    fontSize: kH2,
                    fontColor: Colors.grey,
                    isCenter: false,
                ),
              ),
              const Divider(),
              _formCity(),
              const Divider(),
              FormTextWidget(
                hinText: AuthController.to.currentUser.value.street!,
                controller: ProfileController.to.controllerStreet,
              ),
              const Divider(),
              FormTextWidget(
                hinText: AuthController.to.currentUser.value.neighborhood!,
                controller: ProfileController.to.controllerNeighborhood,
              ),
              const Divider(),
              FormTextWidget(
                hinText: AuthController.to.currentUser.value.number!,
                controller: ProfileController.to.controllerNumber,
              ),
              const Divider(),
              ElevatedButtonWidget(
                onTap: ProfileController.to.updateAddres,
                height: kBigButton,
                buttonText: 'Prontinho',
                fontSize: kH2,
                buttonColor: Colors.blue,
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
        controller:  ProfileController.to.controllerLocation,
        maxSuggestionsInViewPort: 3,
        marginColor: Colors.white,
        suggestionStyle: TextStyle(
          fontSize: kH2,
        ),
        searchStyle: TextStyle(
          fontSize: kH2,
          color: Colors.blue,
        ),
        searchInputDecoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
          labelStyle: TextStyle(
            fontSize: kH2,
          ),
          hintText: AuthController.to.currentUser.value.location,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: kH2,
          ),
        ),
      );
  }
}
