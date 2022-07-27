import 'package:adove/app/module/initial/controllers/initial.dart';
import 'package:adove/app/module/initial/widgets/fab.dart';
import 'package:adove/app/module/initial/widgets/image.dart';
import 'package:adove/app/module/initial/widgets/pink_background.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.scaffoldBackgroundColor,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Stack(
        children: [
          const PinkBackgroundInitialWidget(),
          Positioned(
            top: Get.mediaQuery.size.height * 0.15,
            bottom: Get.mediaQuery.size.height * 0.05,
            right: Get.mediaQuery.size.width * 0.0008,
            child:
                const ImageInitialWidget(path: 'assets/images/client-bg-initial.png'),
          ),
          Positioned(
            top: Get.mediaQuery.size.height * 0.8,
            right: Get.mediaQuery.size.width * 0.03,
            child: FabInitialWidget(
              onPressed: controller.verifyStorage,
            ),
          ),
        ],
      ),
    );
  }
}
