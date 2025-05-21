import 'package:flutter/material.dart';
import 'notification.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('알림 테스트')),
      floatingActionButton: FloatingActionButton(

        onPressed: () async {
          await checkExactAlarmPermission();  // 권한 확인
          showNotification2();                // 알림 보내기
          print("알림을 보냈습니다.");
        },
        /*
        onPressed: () {
          showNotification2();                // 알림 보내기
          print("알림을 보냈습니다.");
        },
        */
        child: Text('알림'),
      ),
      body: Text('본문'),
    );
  }

  @override
  void initState() {
    super.initState();
    initNotification(context);
  }
}