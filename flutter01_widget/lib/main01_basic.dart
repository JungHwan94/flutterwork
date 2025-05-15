import 'package:flutter/material.dart';
/*
   * widget
   Meterial widget과 Cupertino widget
   : 위젯을 사용하려면 반드시 2개중 하나를 사용해야 그 안의 있는 디잔인 기반으로 위젯이 만들어짐
     (미리 만들어 놓은 위젯들 가져다 사용함)
   1. Meterial widget : 안드로이드용 위젯
   2. Cupertino widget : 아이폰용 위젯

   * widget의 종류
     1. Text() : 글씨 위젯 -> Text('글씨')
     2. Image() : 이미지 위젯 -> Image.asset('이미지url')
     3. Icon() : 아이콘 위젯 -> Icon(Icons.??)
     4. Container() : 박스 위젯
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text('글씨'),
      // home: Icon(Icons.star),
      // home: Image.asset('assets/images/girl1.png')
      /*home: Center(
        child: Container(
          color: Colors.deepOrangeAccent,
          width: 50,
          height: 50,
        ),
      ),*/
      home: Container(
        child: Text('글씨 넣기'),
      ),
    );
  }
}