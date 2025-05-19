import 'package:flutter/material.dart';
/*
  * ThemeData() : 스타일을 모아놓음
    : 파일에서 사용하거나 별도의 파일로 만들어서 사용
 */
void main() {
  runApp(
      MaterialApp(
          theme: ThemeData(
              iconTheme: IconThemeData(color: Colors.red),
              appBarTheme: AppBarTheme(
                  color: Colors.grey,
                  actionsIconTheme: IconThemeData(color: Colors.blueAccent)
              ),
              textTheme: TextTheme(
                  bodyMedium: TextStyle(color: Colors.purple)
              )
          ),
          home: const MyApp()
      )
  );
}

var textColor = TextStyle(fontSize: 20, color: Colors.blueGrey);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.stacked_bar_chart)],),
      body: Column(
        children: [
          Icon(Icons.star),
          Text('안녕'),
          Text('별도 스타일 : 변수에 저장', style: textColor)
        ],
      ),
    );
  }
}