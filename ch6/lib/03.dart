
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget{
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {

  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _ageCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('01. 네비게이션 기본 실습')),
        body: Column(
          children: [
            TextField(
              controller: _nameCont,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이름입력'
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _ageCont,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '나이입력'
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SecondScreen()
                  ));

                  String name = _nameCont.text;
                  int age = int.tryParse(_ageCont.text) ?? 0;

                  // Second Screen 이동
                  Navigator.push(context, '/second');
                },
                child: const Text('Second Screen 이동')
            )
          ],
        )
    );
  }
}

class SecondScreen extends StatelessWidget {

  final String name;
  final int age;

  const SecondScreen({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('01. 네비게이션 데이터 전달 실습')),
        body: Column(
          children: [
            const Text('Second Screen', style: TextStyle(fontSize: 36),),
            const SizedBox(height: 10,),
            Text('$name, / $age'),
            ElevatedButton(
                onPressed: (){


                  // 현재 화면 위젯 스텍 제거, 뒤로가기
                  Navigator.pop(context);
                },
                child: const Text('First Screen 이동')
            ),
          ],
        )
    );
  }
}

