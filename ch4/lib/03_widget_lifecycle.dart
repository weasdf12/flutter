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
          title: const Text('03.상태 생명주기 실습'),
        ),
        body: ParentWidget(),
      ),
    );
  }

}

class ParentWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{

  // 상테
  int counter = 0;
  bool showChild = true;

  void _increment(){
    setState(() {
      counter++;
    });
  }

  void _toggleChild(){
    setState(() {
      showChild = !showChild;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        showChild
            ? ChildWidget(count: counter)
            : Text('Childwiget 제거', style: TextStyle(fontSize: 26),),

        ElevatedButton(onPressed: _increment,
            child: const Text('Childwidget 변역ㅇ')
        ),
        ElevatedButton(onPressed: _toggleChild,
            child: const Text('Childwidget 생성/ㅈ[거')
        )


      ],
    );
  }

}

// Childwidget 선언 클래스
class ChildWidget extends StatefulWidget{

  ChildWidget({super.key, required this.count});
  
  int count;

  @override
  State<StatefulWidget> createState() {
    return _ChildeWidgetState();
  }

}
// Childwidget 구현 클래스
class _ChildeWidgetState extends State<ChildWidget>{

  @override
  void initState() {
    print('init');
  }

  @override
  void didChangeDependencies() {
    print('didcha');
  }
  

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: Text(
        'childwidget count : ${widget.count}',
        style: TextStyle(fontSize: 26),),
    );
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    print('didup');
  }

  @override
  void dispose() {
    print('dispo');
  }
}