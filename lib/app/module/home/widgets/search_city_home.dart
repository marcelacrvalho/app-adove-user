import 'package:adove/app/global/helpers/cities.dart';
import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class SearchCityHomeWidget extends StatelessWidget {
  const SearchCityHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height < 550
            ? Get.mediaQuery.size.height * 0.095
            : Get.mediaQuery.size.height * 0.075,
        padding: Get.height < 550
            ? const EdgeInsets.symmetric(horizontal: 8.0)
            : const EdgeInsets.symmetric(horizontal: 10.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: appThemeData.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 50.0,
              color: appThemeData.primaryColor.withOpacity(0.3),
            ),
          ],
        ),
        child: _listSuggestions(),
      ),
    );
  }

  Widget _listSuggestions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SearchField(
            suggestions: Cities.listCities,
            controller: HomeController.to.localizationController,
            maxSuggestionsInViewPort: 3,
            marginColor: Colors.white,
            suggestionStyle: const TextStyle(
              fontSize: kH2,
            ),
            searchStyle: const TextStyle(
              fontSize: kH2,
              color: Colors.blue,
            ),
            searchInputDecoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: const TextStyle(
                fontSize: kH2,
                color: Colors.grey,
              ),
              hintText: AuthController.to.controllerLocationRegister.text,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: kH2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
