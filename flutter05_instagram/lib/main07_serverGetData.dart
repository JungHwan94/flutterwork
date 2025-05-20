import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
  * 서버(DB)에서 데이터 요청하여 얻어오기
    - get 요청

  * package설치 필요 : http
  * 안드로이드 인터넷사용 권한 설정
  * import 하기
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
      body: [Home(feedItems : feedItems), Text('Shop Page')][tab],
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