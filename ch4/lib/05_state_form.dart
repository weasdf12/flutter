
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('05. 홈 위젯 실습'),),
        body: FormPage(),
      ),
    );
  }

}
class FormPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormPageStats();
}

class _FormPageStats extends State<FormPage>{

  // 폼을 식별하고 상태를 관리하는 전역키 생성
  final _formkey = GlobalKey<FormState>();

  //컨트롤러 생성
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //상태 변수
  String _email = '';
  bool _isCheck = false;
  String _gender = 'M';
  bool _isSwitched = false;
  String _submitResult = '';

  // 폼 취소 함수
  void _cancleForm(){
    _formkey.currentState!.reset();

    _idController.clear();
    _pwController.clear();
    _nameController.clear();

    _isCheck = false;
    _isSwitched =false;

    _submitResult = '';

    //화면 재빌드cv
    setState(() {});
  }

  // 폼 제출 함수
  void _submitForm(){
    //폼 유효성 검사
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();

      String idValue = _idController.text;
      String pwValue = _pwController.text;
      String nameValue = _nameController.text;

      setState(() {
        _submitResult = '입력 성공\n'
            '아이디 : $idValue\n'
            '비밀번호 : $pwValue\n'
            '이름 : $nameValue\n'
            '이메일 : $_email\n'
            '가입동의 : $_isCheck\n'
            '성별 : $_gender\n'
            '푸시 알림 허용 : $_isSwitched';
      });
    } else{
      setState(() {
        _submitResult = '입력 실패';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: 'id',
                  border: OutlineInputBorder()
                ),
                validator : (value){
                  if (value == null || value.isEmpty)
                    return '아이디 입력';
                  if (value.length < 4)
                    return '아이디 4자 이상';

                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _pwController,
                obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'pw',
                      border: OutlineInputBorder()
                  ),
                validator : (value){
                    if (value == null || value.isEmpty)
                      return '비번 입력';
                    if (value.length < 6)
                      return '비번 6자 이상';

                    return null;
                  },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder()
                ),
                validator : (value){
                  if (value == null || value.isEmpty)
                    return 'dlfma 입력';


                  return null;
                },
              ),

              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.emailAddress,
                validator : (value){
                  if (value == null || value.isEmpty)
                    return 'email 입력';
                  //if (value.contains('@'))
                   // return 'email 형식';
                  return null;
                },
                onSaved: (value){
                  _email = value!;
                },
              ),

              const SizedBox(height: 10,),
              CheckboxListTile(
                title: const Text('회원가입 동의'),
                value: _isCheck,
                onChanged: (value){
                  setState(() {
                    _isCheck = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),


              const SizedBox(height: 10,),
              const Text('성별 선택', style: TextStyle(fontSize: 16),),
              RadioGroup<String>(
                  onChanged: (value){
                    setState(() {
                      _gender = value ?? '';
                    });
                  },
                  groupValue: _gender,
                  child: Row(
                    children: [
                      Expanded(
                          child: RadioListTile<String>(
                              value: 'M',
                            title: const Text('남자'),
                          )
                      ),
                      Expanded(
                          child: RadioListTile<String>(
                            value: 'F',
                            title: const Text('여자'),
                          )
                      ),
                    ],
                  )
              ),

              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text('푸시 알림 허용'),
                  const Spacer(),
                  Switch(
                      value: _isSwitched,
                      onChanged: (value){
                        setState(() {
                          _isSwitched = value;
                        });
                      }
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _cancleForm,
                      child: const Text('취소')
                  ),
                  ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('제출')
                  ),
                ],
              ),

              const SizedBox(height: 10,),
              Text(_submitResult)
            ],
          )
      ),
    );
  }
}