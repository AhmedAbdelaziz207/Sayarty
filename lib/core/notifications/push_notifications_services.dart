// import 'dart:developer';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'local_notifications_service.dart';
//
// class FirebaseNotificationsServices {
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//   static bool? isNotificationsEnabled;
//
//   static String firebaseScope =
//       "https://www.googleapis.com/auth/firebase.messaging";
//
//
//   static init() async {
//     messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     log("FCM token: ${await messaging.getToken()}");
//     //
//     // isNotificationsEnabled =
//     //     PreferencesManager.getIsNotificationEnabled() ?? true;
//
//     FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
//
//     FirebaseMessaging.onMessage.listen((event) {
//
//       onMessaging(event);
//     });
//   }
//
//   static Future<void> onBackgroundMessage(RemoteMessage message) async {
//     // await Firebase.initializeApp(
//     //   options:,
//     // );
//   }
//
//   static Future onMessageOpenedApp(RemoteMessage message) async {
//     await Firebase.initializeApp();
//     log(message.notification?.title.toString() ?? "Null");
//   }
//
//   static void subscribeToTopic(String topic) async {
//     log("subscribeToTopic $topic");
//     await FirebaseMessaging.instance.subscribeToTopic(topic);
//   }
//
//   static void unSubscribeFromTopic(String topic) async {
//     await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
//   }
//
//   static void unSubscribeFromAllTopics() async {
//     log("unSubscribeFromAllTopics");
//     List<String> topics = [
//       "normal-users-en",
//       "all-users-en",
//       "all-users-ar",
//       "normal-users-ar",
//       "technicians-en",
//       "technicians-ar",
//     ];
//     for (String topic in topics) {
//       await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
//     }
//   }
//
//   static void onMessaging(RemoteMessage message) {
//     LocalNotificationService.showBasicNotification(message);
//   }
//
//   static String getDeviceToken() {
//     return FirebaseMessaging.instance.getToken().toString();
//   }
//   static void sendFcmTokenToServer() async {
//
//   }
// }
