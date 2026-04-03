import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../main.dart';

class NotificationService {
  static const _androidDetails = AndroidNotificationDetails(
    'reivi_reminders', 'Erinnerungen',
    channelDescription: 'Erinnerungen für deine Einträge',
    importance: Importance.defaultImportance,
    priority:   Priority.defaultPriority,
  );

  static Future<void> requestPermission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> schedule({
    required int    id,
    required String title,
    required String body,
    required DateTime when,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id, title, body,
      tz.TZDateTime.from(when, tz.local),
      const NotificationDetails(android: _androidDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> cancel(int id) async =>
      flutterLocalNotificationsPlugin.cancel(id);
}
