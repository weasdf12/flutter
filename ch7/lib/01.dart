import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('01'),),
        body: Futuresc(),
      ),
    );
  }
}

class Futuresc extends StatefulWidget{
  const Futuresc({super.key});

  @override
  State<StatefulWidget> createState() => _Futuresc();

}
class _Futuresc extends State<Futuresc>{

  String result = 'wait result';
  bool isLoading = false;

  Future<String> fetchData(){
    return Future.delayed(const Duration(seconds: 3), (){
      return 'asdf';
    });
  }

  void loadData(){

    setState(() {
      result = 'loading..';
    });

    fetchData().then((data){
      setState(() {
        result = data;
      });
    }).catchError((err){
      setState(() {
        result = err;
      });
    }).whenComplete((){
      print('완');
    });

    setState(() {
      result = 'loading...';
    });
  }

  int count = 0;
  bool isCounting = false;

  Future<int> startCnt() async {
    setState(() {
      isCounting = true;
    });

    for(int i=1 ; i<= 5; i++){
      Future.delayed(const Duration(seconds: 3));

      setState(() {
        count = i;
      });
    }

    setState(() {
      isCounting = false;
    });

    return count;
  }

  void handleCnt() async{
    int result = await startCnt();
    setState(() {
      count = result +1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(result, style: TextStyle(fontSize: 16),),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: loadData,
              child: const Text('데이터 불러오기')),
          const SizedBox(height: 10,),
          Text('result : $count'),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                handleCnt();
              },
              child: const Text('round start')),
        ],
      ),
    );
  }

}