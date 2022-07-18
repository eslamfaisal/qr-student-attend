import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void setUpNotifications() async {
  // background message handler
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // foreground message handler
  await Firebase.initializeApp();
  listenToNewForegroundNotification();
  listenToOpenedNotification();
  setUpLocaleNotification();

  await FirebaseMessaging.instance.subscribeToTopic("all");
}

void setUpLocaleNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_logo');
  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
    onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
}

void listenToNewForegroundNotification() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    showFCMNotification(message);
  });
}

void listenToOpenedNotification() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    openNotification(message);
  });

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      openNotification(message);
    }
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  showFCMNotification(message);
}

void showFCMNotification(RemoteMessage message) async {
  showLocaleNotification(message);
}

void showLocaleNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title,
    message.notification?.body,
    platformChannelSpecifics,
    payload: jsonEncode(message.data),
  );

  print("Shown a notification data: ${message.data.toString()}");
}

void openNotification(RemoteMessage message) {
  onSelectNotification(jsonEncode(message.data));
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {
  onSelectNotification(payload);
}

void onSelectNotification(String? payload) {
  print('onSelectNotification payload: $payload');

}
