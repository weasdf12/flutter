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
      home: const MyHomePage(title: '03 asdf'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text('100 X 100'),
            ),
            Container(
              width: 200,
              height: 200,
              //color: Colors.teal,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal,
                border: Border.all(width: 1, color: Colors.black)
              ),
              child: Text('teal'),

            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.indigoAccent),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('images/flower1.jpg'),
                    fit: BoxFit.cover
                )
              ),
            ),
          ]
      ),


    );
  }
}
