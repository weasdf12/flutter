
import 'package:flutter/material.dart';

class User{
  String userid;
  String name;
  int age;

  User({required this.userid, required this.age,required this.name});

  @override
  String toString() {
    return 'User{userid: $userid, name: $name, age: $age}';
  }

}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/first',
        routes:  {
          '/first' : (context) => FirstScreen(),
          '/second' : (context) => const SecondScreen(),
        },
    );
  }
}

class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FirstScreenState();

}

class _FirstScreenState extends State<FirstScreen> {

  final TextEditingController _useridCont = TextEditingController();
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _ageCont = TextEditingController();

  String savedUser = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text('04. routes argument 기본 실습')),
        body: Column(
          children: [
            const Text('First Screen', style: TextStyle(fontSize: 36),),
            TextField(
              controller: _useridCont,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'id'
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _nameCont,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name'
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _ageCont,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'age'
              ),
            ),
            const SizedBox(height: 10,),
            Text('savedUser : $savedUser'),


            ElevatedButton(
                onPressed: () async{

                  String userid = _useridCont.text;
                  String name = _nameCont.text;
                  int age = int.tryParse(_ageCont.text) ?? 0;

                  final user = User(
                      userid: userid, age: age, name: name
                  );
                  // Second Screen 이동

                  final returnedUser = await Navigator.pushNamed(context, '/second', arguments: {'user': user});
                  setState(() {
                    savedUser = returnedUser.toString();
                  });

                },
                child: const Text('Second Screen 이동')
            )
          ],
        )
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final User receivedUser = arguments['user'] as User;

    return Scaffold(
        appBar: AppBar(title: const Text('01. 네비게이션 기본 실습')),
        body: Column(
          children: [
            const Text('Second Screen', style: TextStyle(fontSize: 36),),
            Text('id : ${receivedUser.userid}, name : ${receivedUser.name}, age : ${receivedUser.age}'),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  // 현재 화면 위젯 스텍 제거, 뒤로가기
                  Navigator.pop(context, receivedUser);
                },
                child: const Text('First Screen 이동')
            ),
          ],
        )
    );
  }
}


class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('01. 네비게이션 기본 실습')),
        body: Column(
          children: [
            const Text('Third Screen', style: TextStyle(fontSize: 36),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  // 현재 화면 위젯 스텍 제거, 뒤로가기
                  Navigator.pop(context);
                },
                child: const Text('Second Screen 이동')
            )
          ],
        )
    );
  }
}