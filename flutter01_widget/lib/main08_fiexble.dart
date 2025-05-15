import 'package:flutter/material.dart';
/*
  * Fiexible() : flex와 비슷
    : 전체에서 ?% 자리차지 같은것을 사용할 때 편리
     (Row(), Column()과 같이 사용)

  * Expanded() : Fiexible과 유사
    : 나머지 부분을 다 자리차지
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFf3edf7),
            title: Text('강남역'),
            actions: [
              Icon(Icons.search),
              Icon(Icons.menu),
              Icon(Icons.notification_add)
            ],
          ),
          /*
        body: Column(
          children: [
            Flexible(child: Container(color: Colors.amber,), flex: 1),
            Flexible(child: Container(color: Colors.black26), flex: 1),
            Flexible(child: Container(color: Colors.purpleAccent), flex: 1),
          ],
        )
         */
          body : Column(
            children: [
              Container(height: 100, color: Colors.amber),
              Expanded(child: Container(color: Colors.black26)),
            ],
          )
      ),
    );
  }
}