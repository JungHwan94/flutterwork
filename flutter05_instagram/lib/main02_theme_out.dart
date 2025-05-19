import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';

void main() {
  runApp(
      MaterialApp(
          theme: theme,
          home: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        body: Column(
          children: [
            TextButton(onPressed: (){}, child: Text('Text Button')),
            ElevatedButton(onPressed: (){}, child: Text('Elevated Button')),
            Text('더조은 풀스택', style: Theme.of(context).textTheme.bodyMedium,),
            Text('다른 글씨', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
    );
  }
}