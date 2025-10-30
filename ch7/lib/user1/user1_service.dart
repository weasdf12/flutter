

import 'dart:convert';
import 'dart:math';

import 'package:ch7/user1/user1.dart';
import 'package:http/http.dart' as http;

class User1Service {

  // Flutter 에뮬레이터에서 localhost는 자기자신이기 때문에 에뮬레이터 외부 아이피 주소 사용
  static const String baseUrl = 'http://10.0.2.2:8080/ch08';

  Future<List<User1>> getUsers() async {
    try{

      final resopnse = await http.get(Uri.parse('$baseUrl/user1'));



      if(resopnse.statusCode == 200){

        List<dynamic> jsonList = jsonDecode(resopnse.body);


        return jsonList.map((json)=> User1.fromJson(json)).toList();

      } else{
        throw Exception('${resopnse.statusCode}');
      }
    }catch (err){

      throw Exception('$err');
    }
  }

  void getUser() {}


  Future<User1> postUser(User1 user) async {
    try {
      final response = await http.post(
          Uri.parse('$baseUrl/user1'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(user.toJson()));

      if(response.statusCode == 201){
        return User1.fromJson(jsonDecode(response.body));
      }else {
        throw Exception('예외발생 : ${response.statusCode}');
      }
    }catch (err){
      throw Exception('에러발생 : $err');
    }
  }

  void putUser() {}

  void deleteUser() {}


}