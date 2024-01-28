import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notification {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("success.png");

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      onDidReceiveLocalNotification:
    (int id, String? title, String? body, String? payload) async {});

    var initiaLizedSettings = InitializationSettings(
      android: initializationSettingsAndroid,iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(initiaLizedSettings,
    onDidReceiveNotificationResponse:(NotificationResponse notificationResponse) async{}
    );
  }
}
