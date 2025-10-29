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
        appBar: AppBar(title: const Text('02'),),
        body: FutureSc(),
      ),
    );
  }
}

class FutureSc extends StatefulWidget{
  const FutureSc({super.key});

  @override
  State<StatefulWidget> createState() => _Futuresc();

}
class _Futuresc extends State<FutureSc>{

  Future<String>? futureResult;

  Future<String> fetchData(){
    return Future.delayed(const Duration(seconds: 3), (){
      return 'asdf';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        children: [
          FutureBuilder(
            future: futureResult,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              } else if (snapshot.hasError){
                return Text('error : ${snapshot.error}');
              } else if (snapshot.hasError){
                return Text('result : ${snapshot.data}');
              } else {
                return Text('data load pls');
              }
            }
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            setState(() {
              futureResult = fetchData();
            });

          },
              child: const Text('data load'))
        ],
      ),
    );
  }

}