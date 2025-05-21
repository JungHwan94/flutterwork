import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
/*
  > 부모가 자식에게 넘겨줘야하는 값이 많다든지, 자식이 많아서 여러번에 걸쳐서 넘겨주려면 귀찬음
  * Provider : 전송없이 모든 위젯이 state를 가져다 쓸 수 있게 만든 패키지
    - state를 보관하는 store가 필요함 : class로 만들어서 모든 state를 넣어줌
 */
void main() {
  runApp(
    /*  store가 1개 일때
    ChangeNotifierProvider(
      create: (context) => Store1(),
      child: MaterialApp(
        theme: theme,
        home: const MyApp(),
      ),
    )
     */

    // store가 여러개 일때
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Store1()),
          ChangeNotifierProvider(create: (context) => Store2())
        ],
        child: MaterialApp(
          theme: theme,
          home: const MyApp(),
        ),
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
  var userImage;
  var userContent;

  setUserContent(newContent) {
    setState(() {
      userContent = newContent;
    });
  }

  addMyData() {
    String formattedDate = DateFormat('MMM dd').format(DateTime.now());

    var myData = {
      "id": feedItems.length,
      "image": userImage,
      "likes": 0,
      "date": formattedDate,
      "content": userContent,
      "liked": false,
      "user": "Jennifer"
    };
    setState(() {
      feedItems.insert(0, myData);
    });
  }

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
              onPressed: () async{
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);
                if(image != null) {
                  userImage = File(image.path);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Upload(
                            userImage : userImage,
                            setUserContent : setUserContent,
                            addMyData : addMyData
                        )
                    )
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
  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

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
    if(isLoading || !hasMore) {
      return;
    }
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data$page.json'));
    if(result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      if(result2.isEmpty) {
        hasMore = false;
      } else {
        widget.addData(result2);
        page++;
      }
    } else {
      hasMore = false;
      throw Exception('get server data 실패');
    }
    isLoading = false;
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
                widget.feedItems[i]['image'].runtimeType == String
                    ? Image.network(widget.feedItems[i]['image'])
                    : Image.file(widget.feedItems[i]['image']),
                Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('좋아요  ${widget.feedItems[i]['likes']}'),
                        GestureDetector(
                          child: Text('글쓴이  ${widget.feedItems[i]['user']}'),
                          onTap: (){
                            Navigator.push(
                                context,
                                // fadein
                                PageRouteBuilder(
                                    pageBuilder: (context, a1, a2) => Profile(),
                                    transitionsBuilder: (c, a1, a2, child ) =>
                                        FadeTransition(opacity: a1, child: child),
                                    transitionDuration: Duration(milliseconds: 1000)
                                )
                            );
                          } ,
                        ),
                        Text('내용  ${widget.feedItems[i]['content']}'),
                        Text('날짜  ${widget.feedItems[i]['date']}')
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

// store 클래스 만들기
class Store1 extends ChangeNotifier {
  var name = 'john lee';

  changeName(name2) {
    name = name2;
    notifyListeners();  // 재렌더링(set state가 아니라)
  }
}

class Store2 extends ChangeNotifier {
  var content = '내용 바꿈';

  changeContent(content2) {
    content = content2;
    notifyListeners();
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<Store1>().name),  // .watch() : state를 출력할 때 사용
      ),
      body: ElevatedButton(
          onPressed: (){
            context.read<Store1>().changeName('john park');    // .read() : 함수를 사용할 때
          },
          child: Text('이름 바꾸기')
      ),
    );
  }
}


class Upload extends StatelessWidget {
  const Upload({super.key, this.userImage, this.setUserContent, this.addMyData});
  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                addMyData();
                Navigator.pop(context);
              },
              icon: Icon(Icons.send)
          )
        ],
      ),
      body: Column(
        children: [
          Text('이미지 업로드 화면'),
          Image.file(userImage),
          TextField(onChanged: (text) {
            setUserContent(text);
          },),
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