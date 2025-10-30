import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget{
  const SearchTab({super.key});

  @override
  State<StatefulWidget> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'),),
      body: Column(
        children: [
          Text('Search 메인')
        ],
      ),
    );
  }

}