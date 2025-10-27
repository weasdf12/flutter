import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: '06 위치 관련 위젯'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        children: [

          //align : 속성 위치에 배치하기
          Container(
            width: double.infinity, //가로 100%
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1)
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),

          // fractionalOffset
          Container(
            width: double.infinity, //가로 100%
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(width: 1)
            ),
            child: Align(
              alignment: FractionalOffset(1, 1),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
          //stack
          Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ],
          ),

          // IndexedStack : 위젯을 겹쳐서 배치하고 인덱스 번호로 화면에 표시
          IndexedStack(
            index: 2,
            children: [
              Text('1 text', style: TextStyle(fontSize: 24),),
              Text('2 text', style: TextStyle(fontSize: 24),),
              Text('3 text', style: TextStyle(fontSize: 24),)
            ],
          ),

          // Positioned
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1)
            ),
            child: Stack(
              children: [
                Positioned( //Positioned 위젯은 반드시 Stack위젯 자식 위젯으로 사용
                  left: 10,
                  top: 10,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  )
                ),
                Positioned( //Positioned 위젯은 반드시 Stack위젯 자식 위젯으로 사용
                    right: 10,
                    bottom: 10,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    )
                ),


              ],
            ),

          )
        ],
      ),

    );
  }
}
