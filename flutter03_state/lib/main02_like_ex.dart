import 'package:flutter/material.dart';
/*
  * state(변수)
    : 일반변수와 다른점은 변경이되면 재렌더링을 해줌
    > state변수를 사용하려면 StatefulWidget 안에서 사용
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 1;
  var name = ['홍길동', '더조은', '빛나리'];
  var like = [0,0,0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text(num.toString()),
            onPressed: (){
              setState(() {
                num++;
              });
            }
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFf3edf7),
          leading: Icon(Icons.list),
          title: Text('주소록'),
          actions: [Icon(Icons.search), Icon(Icons.share)],
        ),
        body: ListView.builder(
          itemBuilder: (context, i) {
            return ListTile(
              leading: Text(like[i].toString()),
              title: Text(name[i]),
              trailing: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      like[i]++;
                    });
                  },
                  child: Text('좋아요')
              ),
            );
          },
          itemCount: 3,
        ),
        bottomNavigationBar: CustomBottom(),
      ),
    );
  }
}

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.article_outlined),
          Icon(Icons.contacts)
        ],
      ),
    );
  }
}