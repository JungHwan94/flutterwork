import 'package:flutter/material.dart';

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
          body: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/cat.png',
                  width: 190,
                  // fit: BoxFit.cover,
                ),
                SizedBox(width: 15),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 9,
                    children: [
                      Text('고양이 집사 구함', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      Text('개냥이, 활발한 성격'),
                      Text('금액은 만나서 결정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.favorite_border),
                            Text('4')
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}