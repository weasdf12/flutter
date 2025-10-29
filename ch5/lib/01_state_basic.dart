import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : const Text('01 상태 관리 기본'),),
        body: ParentStateApp(),
      ),
    );
  }
}

class ParentStateApp extends StatefulWidget{
  const ParentStateApp({super.key});

  @override
  State<StatefulWidget> createState() => _ParantStateAppState();
}

class _ParantStateAppState extends State<ParentStateApp>{

  //상테 속성
  int _count = 0;
  String _text = '';

  // 자식 위젯에서 사용할 상태 속성
  bool _fav = false;
  int _favcnt = 0;

  void toggleFav(){
    if(_fav){
      _fav = false;
      _favcnt -= 1;
    }else{
      _fav = true;
      _favcnt += 1;
    }
    setState(() {

    });
  }

  void increment(){setState(() {_count++;});}
  void changeText(String newText){setState(() {_text = newText;});}


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$_count'),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                increment();
              },
              child: const Text('up')
          ),
          Divider(),
          Text(_text),
          const SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ad'
            ),
            onChanged: (value){
              changeText(value);
            },
          ),
          Divider(),
          Iconwidget(fav: _fav, togglefun: toggleFav,),
          Contentwidget(fav: _favcnt, )
        ],
      ),
    );
  }
}

class Iconwidget extends StatelessWidget{

  final bool fav;
  final Function togglefun;

  const Iconwidget({
    super.key, this.fav = false, required this.togglefun
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: (){
            togglefun();
          },
          icon: (fav ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        iconSize: 100,
        color: Colors.red,
      ),
    );
  }
}

class Contentwidget extends StatelessWidget{

  final int fav;

  const Contentwidget({super.key, required this.fav});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$fav',
        style: TextStyle(fontSize: 20,
      fontWeight: FontWeight.bold
      ),),
    );
  }
}