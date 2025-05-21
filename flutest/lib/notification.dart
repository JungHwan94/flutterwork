import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/services.dart';

final notifications = FlutterLocalNotificationsPlugin();

void openExactAlarmSettings() {
  final intent = AndroidIntent(
    action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
    flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
  );
  intent.launch();
}

Future<void> checkExactAlarmPermission() async {
  final androidPlugin = notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

  if (androidPlugin != null) {
    final bool? granted = await androidPlugin.requestExactAlarmsPermission();
    if (granted != true) {
      print("⚠️ 알람 권한이 없습니다. 사용자 설정 필요");
    } else {
      print("✅ 알람 권한이 허용됨");
    }
  } else {
    print("Android 환경이 아님 또는 알림 플러그인 초기화 실패");
  }
}


initNotification(context) async {

  notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  // var androidSetting = AndroidInitializationSettings('notification_icon');
  var androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
  var iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting
  );
  await notifications.initialize(
    initializationSettings,

    onDidReceiveNotificationResponse: (payload){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Text('새로운 페이지')
        )
      );
    }
  );

  if (Platform.isAndroid) {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
    notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    final granted = await androidImplementation?.requestExactAlarmsPermission();
    if (granted == true) {
      print("권한받음");
    } else {
      print("권한거절");
    }
  }
}

showNotification2() async {
  tz.initializeTimeZones();

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );

  var iosDetails = const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  final scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: 3));
  print('📅 알림 예약 시간: $scheduledTime');

  try {
    await notifications.zonedSchedule(
      2,
      '제목2',
      '3초 후에 나타나는 알림',
      scheduledTime,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
     // matchDateTimeComponents: null
    );
    print("알림이 예약되었습니다.");
  } on PlatformException catch (e) {
    print("알림 예약 실패: ${e.message}");
  }
}