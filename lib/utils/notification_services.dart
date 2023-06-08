import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static NotificationServices services = NotificationServices._();

  NotificationServices._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNotification() async {
    AndroidInitializationSettings androidSettings =
        const AndroidInitializationSettings('bell');
    DarwinInitializationSettings iOSSettings =
        const DarwinInitializationSettings();

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  showSimpleNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "Android");
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: darwinNotificationDetails, android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(
        1, "Simple Notification", "Local Notification", notificationDetails);
  }

  showSchedualeNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "Android");
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: darwinNotificationDetails, android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.zonedSchedule(
        1, "5 sec Notification", "Flutter", tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
