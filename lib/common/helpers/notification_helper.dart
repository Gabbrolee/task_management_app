import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_management_app/features/todo/pages/notification_screen.dart';
import '../model/task_model.dart';

class NotificationHelper {
  WidgetRef ref;
  NotificationHelper({required this.ref});

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String? selectedNotificationPayload;
  final BehaviorSubject<String?> selectedNotificationSubject =
      BehaviorSubject<String?>();

  initializeNotification() async {
    _configureSelectNotificationSubject();
    await _configureLocalTimeZone();

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestAlertPermission: true,
            requestBadgePermission: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("calender");
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (data) async {
      if (data.payload != null) {
        debugPrint('notification payload: ${data.payload}');
      }
      selectedNotificationSubject.add(data.payload);
    });
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    const String timeZoneName = "Africa/Lagos";
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    showDialog(
        context: ref.context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title ?? ""),
              content: Text(body ?? ""),
              actions: [
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen(
                                  payload: payload,
                                )));
                  },
                  child: const Text("View"),
                )
              ],
            ));
  }

  scheduleNotification(
      int days, int hours, int minutes, int seconds, Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id ?? 0,
        task.title,
        task.description,
        tz.TZDateTime.now(tz.local).add(Duration(
            days: days, hours: hours, minutes: minutes, seconds: seconds)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                "task_reminder_channel", "task_management")),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload:
            "${task.title}|${task.description}|${task.date}|${task.starttime}|${task.endtime}");
  }

  void _configureSelectNotificationSubject() {
    selectedNotificationSubject.stream.listen((String? payload) async {
      var title = payload!.split('|')[0];
      var body = payload.split('|')[1];
      showDialog(
          context: ref.context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(title),
              content: Text(
                body,
                textAlign: TextAlign.justify,
                maxLines: 4,
              ),
              actions: [
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NotificationScreen(
                        payload: payload,
                      );
                    }));
                  },
                  child: const Text("View"),
                ),
              ],
            );
          });
    });
  }
}
