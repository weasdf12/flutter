import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmarket_shopping/providers/auth_provider.dart';
import 'package:kmarket_shopping/screens/member/terms_screen.dart';
import 'package:kmarket_shopping/services/member_service.dart';
import 'package:kmarket_shopping/services/token_storage_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>{

  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  final service = MemberService();
  final tokenStorageservice = TokenStorageService();

  void _procLogin() async {
    final usid = _idController.text;
    final pass = _pwController.text;

    if(usid.isEmpty || pass.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('id, pw input'))
      );
      return ;
    }

    try {
      Map<String, dynamic> jsonData = await service.login(usid, pass);
      String? accessToken = jsonData['accessToken'];
      log('accessToken : $accessToken');
      if(accessToken != null){
        //터큰 저장(provider로 저장)
        //tokenStorageservice.saveToken(accessToken);
        context.read<AuthProvider>().login(accessToken);

        //로그인 화면 닫기
        Navigator.of(context).pop();
      }
    } catch (err){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(err.toString()))
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login'),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png'),
              const SizedBox(height: 20,),
              const Text('login', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              TextField(controller: _idController,decoration: InputDecoration(
                labelText: 'id',
                border: OutlineInputBorder()
              ),),
              const SizedBox(height: 20,),
              TextField(
                controller: _pwController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'pw',
                  border: OutlineInputBorder(),
              ),),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: _procLogin,
                    child: const Text('login',style: TextStyle(fontSize: 20, color: Colors.teal),
                    )
                ),
              ),
              const SizedBox(height: 10,),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_)=>TermsScreen())
                    );
                  },
                  child: const Text('회원가입', style: TextStyle(fontSize: 20, color: Colors.teal)
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

}