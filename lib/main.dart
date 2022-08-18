import 'package:adove/app/global/helpers/dynamic_links.dart';
import 'package:adove/app/routes/app_routes.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/data/notification/custom_notification.dart';
import 'app/module/initial/bindings/initial.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('adove-user-app');
  CustomNotification.verifyNotification();
  CustomNotification.verifyNotificationBackground();
  CustomNotification.verifyNotificationTerminated();
  CustomDynamicLinks.retrieveDynamicLink();
  runApp(
    GetMaterialApp(
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 0),
      title: 'Adove',
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.kInitial,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    ),
  );
}
