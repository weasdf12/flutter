import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatefulWidget{
  const CategoryTab({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CategoryTab'),),
      body: Column(
        children: [
          Text('CategoryTab 메인')
        ],
      ),
    );
  }

}