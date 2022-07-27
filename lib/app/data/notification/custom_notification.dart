import 'dart:convert';
import 'package:adove/app/data/models/push_notification_firebase.dart';
import 'package:adove/app/global/widgets/snackbar/snack.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class CustomNotification {
  static void verifyNotification() async {
    await Firebase.initializeApp();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings setting = await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );

    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((message) {
        PushNotificationFirebase notificationFirebase =
            PushNotificationFirebase(
          title: message.notification!.title,
          body: message.notification!.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );

        if (notificationFirebase != null) {
          SnarckBarWidget.showSnack(
            notificationFirebase.title!,
            notificationFirebase.body!,
          );
        }
      });
    }
  }

  static void verifyNotificationBackground() async {
    await Firebase.initializeApp();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      PushNotificationFirebase notificationFirebase = PushNotificationFirebase(
        title: message.notification!.title,
        body: message.notification!.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      SnarckBarWidget.showSnack(
        notificationFirebase.title!,
        notificationFirebase.body!,
      );
    });
  }

  static void verifyNotificationTerminated() async {
    await Firebase.initializeApp();

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      PushNotificationFirebase notificationFirebase = PushNotificationFirebase(
        title: initialMessage.notification!.title,
        body: initialMessage.notification!.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );
      SnarckBarWidget.showSnack(
        notificationFirebase.title!,
        notificationFirebase.body!,
      );
    }
  }

  static Future sendAndRetrieveMessage(String title, String body,
      {String? token}) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAxTryOvc:APA91bGlJk9cEH-u6bFeXvzTShbtcuqb5f8iBm2aKmGzktZBvc1lOhDgpbGFVGHkk3Lggwqe5ZuYCrGm6F7mOaU3qIAyM7JiuoR31rN0JKEGUx7IEnrowQr4NaEfSBmJObMrpkyKFp41',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
          },
          'priority': 'high',
          'to': token,
        },
      ),
    );
  }
}
