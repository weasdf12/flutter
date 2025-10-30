import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('04'),),
        body: null,
      ),
    );
  }
}

class httpsc extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState()=> _httpscState();
  }

class _httpscState extends State<httpsc>{
  
  String result  = '겨로가';
  Future<void> fetchGet(){
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    return http.get(url, headers: {'Content-Type': 'application/json'}).then((response){

      if(response.statusCode == 200){
        var jsonResult = jsonDecode(response.body);
        setState(() {
          result = '${jsonResult}';
        });
      } else {
        setState(() {
          result = '${response.statusCode}';
        });
      }
    }).catchError((err){
      setState(() {
        result = '$err';
      });
    }).whenComplete((){
      print('완');
    });

  }
  Future<void> fetchPost() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "userid": 1001,
            "title": "test",
                "completed" : false,
          })
      );
      if(response.statusCode == 201){
        final returnedData = jsonDecode(response.body);
        setState(() {
          result = "post get : $returnedData";
        });
      } else {
        setState(() {
          result = "post res : ${response.statusCode}";
        });
      }

    } catch (err){
      result = 'Post get : $err';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(result),
        Row(
          children: [
            ElevatedButton(onPressed: fetchGet, child: const Text('get')),
            ElevatedButton(onPressed: fetchPost, child: const Text('post')),
          ],
        )
      ],
    ),
    );
  }

}
