import 'package:flutter/material.dart';
/*
  * 박스의 margin, padding, 정렬위젯(Align())
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
        appBar: AppBar(title: Text('예제'), backgroundColor: Color(0xFFf3edf7)),
        /*
        body: Container(
          width: 100, height: 100, color: Colors.deepOrangeAccent,
          margin: EdgeInsets.all(20),
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Text('본문내용 본문내용 본문내용 본문내용')
        ),
        */
        /*
        body: Center(   // 가운데로
          child: Container(
              width: 100, height: 100,
              decoration: BoxDecoration(  // 테두리 넣기
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Text('본문내용')
          ),
        ),
        */

        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            color: Colors.amberAccent,
            child: Text('본문 박스', style: TextStyle(color: Colors.red),),
            padding: EdgeInsets.all(20),
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.thumb_up),
              Icon(Icons.emoji_nature),
              Icon(Icons.shopping_cart),
            ],
          ),
        ),
      ),
    );
  }
}