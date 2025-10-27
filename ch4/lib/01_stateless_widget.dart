import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('01.stateless 위젯실습'),
        ),
        body: StatelessTest(),
      ),
    );
  }

}

class StatelessTest extends StatelessWidget{
  StatelessTest({super.key});

  // 속성 변경되더라도 해당속성을 참조하는 text 위젯은 재빌드 되지 않음
  int counter = 0;

  void _increment(){
    counter++;
    print('counter : $counter');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('카운터 : $counter', style: TextStyle(fontSize: 24),),
        ElevatedButton(
            onPressed: _increment,
            child: const Text('카운트')
        )
      ],
    );
  }

}