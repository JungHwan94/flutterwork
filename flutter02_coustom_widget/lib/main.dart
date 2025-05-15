import 'package:flutter/material.dart';
/*
  * ListView() 위젯
   : 같은 위젯이 반복적으로 들어갈 때
   - 스크롤바가 생김
   - 스크롤바의 위치를 감시 기능
   - 메모리 절약 기능 : 스크롤을 아래로 내리면 위쪽에 가려지는 부분은 메모리에서 삭제하여 메모리관리
 */
void main() {
  runApp(const MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFf3edf7)),
        body: ListView(
          children: [
            Text('data', style: TextStyle(fontSize: 100),),
            Text('data', style: TextStyle(fontSize: 100),),
            Text('data', style: TextStyle(fontSize: 100),),
            Text('data', style: TextStyle(fontSize: 100),),
            Text('data', style: TextStyle(fontSize: 100),),
            Text('data', style: TextStyle(fontSize: 100),),
            Text('data', style: TextStyle(fontSize: 100),),
            Text('data', style: TextStyle(fontSize: 100),),
          ],
        ),
      ),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFf3edf7)),
        body: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}


