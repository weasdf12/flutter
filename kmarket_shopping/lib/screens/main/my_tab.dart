import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTab extends StatefulWidget{
  const MyTab({super.key});

  @override
  State<StatefulWidget> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My'),),
      body: Column(
        children: [
          Text('My 메인')
        ],
      ),
    );
  }

}