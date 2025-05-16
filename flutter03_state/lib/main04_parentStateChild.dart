import 'package:flutter/material.dart';
/*
  * 자식이 부모의 변수의 값을 사용하려면
    1. 부모가 자식에게 보내기
    2. 자식은 등록
    3. 자식이 사용
 */
void main() {
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 5;
  var name = ['홍길동', '더조은', '빛나리'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Text('dialog'),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context) {
// 1. 자식에 보내기. 매개변수에 넣기(이름 : 변수명(값))
                  return CustomDialog(num : num);
                }
            );
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
            leading: Image.asset('assets/user${i+1}.png'),
            title: Text(name[i]),
          );
        },
        itemCount: 3,
      ),
      bottomNavigationBar: CustomBottom(),
    );
  }
}

class CustomDialog extends StatelessWidget {
// 2. 자식은 등록하기   매개변수에 넣고 (this.이름), 변수 만들기
  const CustomDialog({super.key, this.num});
  final num;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            // 3. 사용하기
            TextButton(onPressed: (){ }, child: Text(num.toString())),
            TextButton(onPressed: (){ Navigator.pop(context); }, child: Text('취소'))
          ],
        ),
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