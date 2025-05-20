import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

/*
  Navigator : 화면간의 이동을 관리하는 스택구조의 내비게이션 시스템
  - Navigator.push(context, route) : 새로운 화면을 스택 위에 추가
  - Navigator.pop(context) : 현재 화면을 스택에서 제거하고 이전화면이 보임
  - Navigator.pushNamed(context, routeName) : 이름으로 등록된 경로로 이동
  - Navigator.pushReplacement(context, route) : 현재 화면을 새 화면으로 교체
  - Navigator.popUntil(context, predicate) : 특정 조건을 만족할 때까지 뒤로 감
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

  addData(item) {
    setState(() {
      feedItems.addAll(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Upload())
                );
              },
              icon: Icon(Icons.add_box_outlined)
          )
        ],
      ),
      body: [Home(feedItems : feedItems, addData : addData), Text('Shop Page')][tab],
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
  const Home({super.key, this.feedItems, this.addData});
  final feedItems;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    scroll.addListener((){
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        getMore();
      }
    });
  }

  getMore() async{
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data2.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      for(var item in result2) {
        widget.addData(item);
      }
    } else {
      throw Exception('get server data 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.feedItems.isNotEmpty) {
      return ListView.builder(
          controller: scroll,
          itemCount: widget.feedItems.length,
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

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('이미지 업로드 화면'),
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)
          )
        ],
      ),
    );
  }
}
