import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
  FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings(
      'ic_launcher');

  void initializeNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings
    );
    await flutterLocalNotificationPlugin.initialize(initializationSettings);
  }

  void sendNotification({required String title, required String body}) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
        'channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );
    await flutterLocalNotificationPlugin.show(
        0, title, body, notificationDetails);
  }

  void periodicNotification(
      {required String title, required String body}) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
        'channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );
    await flutterLocalNotificationPlugin.periodicallyShow(
        0, title, body, RepeatInterval.everyMinute, notificationDetails);
  }
  void cancelNotification()async{
    await flutterLocalNotificationPlugin.cancelAll();
  }
}
