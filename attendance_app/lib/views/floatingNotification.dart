import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("success.png");

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    InitializationSettings initiaLizedSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(initiaLizedSettings,
        onDidReceiveNotificationResponse: (details) {});
  }

  Future<void> simpleNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            priority: Priority.high,
            importance: Importance.high,
            icon: "success.png",
            channelShowBadge: true,
            largeIcon: DrawableResourceAndroidBitmap("success.png"));

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notificationsPlugin.show(
        0, "Attendance Marked Successfully", "New user", notificationDetails);
  }
}
