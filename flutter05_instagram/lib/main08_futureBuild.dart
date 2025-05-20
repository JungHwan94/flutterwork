import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
  * Future 객체 : 미래에 완료될 작업의 결과를 나타내는 객체
    서버에서 데이터를 가져오거나, 파일을 읽는 등 비동기 작업의 결과를 다룰 때 사용

  * FutureBuilder() : Future 객체를 기다렸다가 UI로 자동 반영
    Future를 기다리는 동안엔 로딩 위젯을 보여주고 완료되면 데이터 화면에 자동으로 표시
    - 나중에 추가되는 데이터는 넣기가 힘들다. 보통 고정적인 데이터에 사용
 */
void main() {
  runApp(
      MaterialApp(
          theme: theme,
          home: const MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var feedItems = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 3));
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState(() {
        feedItems = result2;
      });
    } else {
      throw Exception('get server data 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.add_box_outlined))
        ],
      ),
      // future: feedItems -> Future 객체를 넣는다. Future는 함수로 되어 있어야 됨
      // body: [FutureBuilder(future: feedItems, builder: (context, snapshot){return Home(feedItems: snapshot.data);}), Text('Shop Page')][tab],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Shop')
          ]
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, this.feedItems});
  final feedItems;

  @override
  Widget build(BuildContext context) {
    if(feedItems.isNotEmpty) {
      return ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return Column(
              children: [
                Image.network(feedItems[i]['image']),
                Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('좋아요  ${feedItems[i]['likes']}'),
                        Text('글쓴이  ${feedItems[i]['user']}'),
                        Text('내용  ${feedItems[i]['content']}')
                      ],
                    )
                ),
              ],
            );
          }
      );
    } else {
      // return Text('로딩중');
      return Center(child: CircularProgressIndicator());
    }
  }
}