import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'text widget test',
      home: const MyHomePage(title: 'text widget test'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1. text widget test'),
          Text(
            'asdf',
            style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),),

          Text('wwwwwwwwwwww',
          style: TextStyle(
            fontSize: 16
          ),
            overflow: TextOverflow.ellipsis,
          ),

          Text.rich(
            TextSpan(
              text: 'HE',
              children: [
                TextSpan(
                  text: 'LLO',
                  style: TextStyle(color: Colors.red)
                ),
              ]
            )
          )
        ],
      )


    );
  }
}
