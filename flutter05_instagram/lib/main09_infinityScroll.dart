import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';  // 스크롤에 관련된 함수 모음
/*
  * 무한 스크롤
    스크롤이 바닥에 닿으면 데이터를 얻어와서 보여주기

    1. import하기
    2. 스크롤의 상태를 파악하기 위해 Home을 stateful로 변경
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
              icon: Icon(Icons.add_box_outlined)
          )
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

class Home extends StatefulWidget {
  const Home({super.key, this.feedItems});
  final feedItems;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 스크롤바의 위치를 기록해주는 함수
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    // 스크롤 이벤트리스너를 한번 등록
    scroll.addListener((){
      // print('스크롤의 위치 변함');
      // print(scroll.position.pixels);  // 스크롤이 위에서 부터 얼마나 내려왔는지 높이
      // print(scroll.position.maxScrollExtent);  // 스크롤바를 최대 내릴수 있는 높이
      // print(scroll.position.userScrollDirection);   // 스크롤이 되는 방향
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        print('더이상 스크롤될게 없습니다');
      }
    });  // addListener() : 리스너 스크롤될 때 마다 호출
  }

  @override
  Widget build(BuildContext context) {
    if(widget.feedItems.isNotEmpty) {
      return ListView.builder(
          controller: scroll,
          itemCount: 3,
          itemBuilder: (c, i) {
            return Column(
              children: [
                Image.network(widget.feedItems[i]['image']),
                Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('좋아요  ${widget.feedItems[i]['likes']}'),
                        Text('글쓴이  ${widget.feedItems[i]['user']}'),
                        Text('내용  ${widget.feedItems[i]['content']}')
                      ],
                    )
                ),
              ],
            );
          }
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}