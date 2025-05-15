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
            Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/user1.png', width: 50,),
                    SizedBox(width: 30,),
                    Text('홍길동')
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/user2.png', width: 50,),
                    SizedBox(width: 30,),
                    Text('더조은')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
*/

// ListView에서 ListTile(): 같은 layout을 여러개 생성할 때 유용
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFf3edf7)),
        /*
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/user1.png'),
              title: Text('홍길동'),
            ),
            ListTile(
              leading: Image.asset('assets/user2.png'),
              title: Text('이한빛'),
            )
          ],
        )
        */

        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text('반복됨 $index');
          },
          itemCount: 5,
        ),
      ),
    );
  }
}



