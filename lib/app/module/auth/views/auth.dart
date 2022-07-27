import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/button/elevated.dart';
import 'package:adove/app/global/widgets/text/input.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: _body(),
        appBar: _tabBar(),
      ),
    );
  }

  PreferredSizeWidget _tabBar() {
    return AppBar(
      backgroundColor: appThemeData.scaffoldBackgroundColor,
      toolbarHeight: Get.mediaQuery.size.height * 0.05,
      automaticallyImplyLeading: false,
      bottom: TabBar(
        labelColor: Colors.black,
        indicatorColor: appThemeData.primaryColor,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: kH3,
          letterSpacing: 2.0,
        ),
        tabs: const [
          Tab(text: 'ENTRAR'),
          Tab(text: 'CADASTRAR'),
        ],
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      children: [
        _loginTab(),
        _registerTab(),
      ],
    );
  }

  Widget _loginTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: 'Você voltou!',
                fontSize: kH2,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: 'Sentimos sua falta <3',
                fontSize: kH2,
                fontColor: Colors.grey,
              ),
            ),
            const Divider(),
            FormTextWidget(
              controller: AuthController.to.controllerEmailLogin,
              hinText: 'Seu e-mail',
            ),
            const Divider(),
            FormTextWidget(
              controller: AuthController.to.controllerPasswordLogin,
              hinText: 'Sua senha',
              isObscureText: true,
            ),
            const Divider(),
            Obx(
              () => Visibility(
                visible: AuthController.to.visibleButton.value,
                child: ElevatedButtonWidget(
                  onTap: AuthController.to.loginUser,
                  height: kBigButton,
                  buttonText: 'Vamos lá',
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
    );
  }

  Widget _registerTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: 'Registre-se',
                fontSize: kH2,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: 'É rapidinho, eu juro!',
                fontSize: kH2,
                fontColor: Colors.grey,
              ),
            ),
            const Divider(),
            FormTextWidget(
              controller: AuthController.to.controllerNameRegister,
              hinText: 'Qual é o seu nome?',
            ),
            const Divider(),
            FormTextWidget(
              controller: AuthController.to.controllerEmailRegister,
              hinText: 'Seu e-mail',
            ),
            const Divider(),
            FormTextWidget(
              controller: AuthController.to.controllerPasswordRegister,
              hinText: 'Sua senha',
              isObscureText: true,
            ),
            const Divider(),
            ElevatedButtonWidget(
              onTap: AuthController.to.toAddressView,
              height: kBigButton,
              buttonText: 'Vamos lá',
              fontSize: kH2,
              buttonColor: appThemeData.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
