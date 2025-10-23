
void main() {
//변수와 기본 타입

  String name = 'abc';
  int age = 21;
  double height = 1.1;
  bool isStudent = true;
  num score = 1; // 숫자형(int, double 포함하는 상위 타입)
  var address = 'qwer'; //자동 추론 타입(컴파일 시점, 최초 한번 타입이 정해지면 변경 불가)
  dynamic etc = 'zxcv'; //자동 동적 타입(런타임 시점, 최초 한번 타입이 정해져도 변경 가능)

  print('이름 : ${name}\n나이 : ${age}'
      '\n키 : ${height}\n학생여부 : ${isStudent}'
      '\n 주소: ${address}');

  // nullable 타입, dart의 기본 변수는 모두 non-nullable, null 취급하기 위해서 타입뒤에 ? 표기
  String? value1 = null;
  int? value2;

  print('value1 : ${value1}, value2 : ${value2}');

  //타입 확인
  print('name 타입 : ${name.runtimeType}');
  print('age 타입 : ${age.runtimeType}');
  print('height 타입 : ${height.runtimeType}');
  print('isStudent 타입 : ${isStudent.runtimeType}');
  print('score 타입 : ${score.runtimeType}');
  print('address 타입 : ${address.runtimeType}');
  print('etc 타입 : ${etc.runtimeType}');
  print('value1 타입 : ${value1.runtimeType}');
  print('value2 타입 : ${value2.runtimeType}');

  //타입 변환
  String strNum = '1234';
  int intNum = int.parse(strNum);
  print('intNum : ${intNum}');

  double price = 12.1;
  int intPrice = price.toInt();
  print('intPrice : ${intPrice}');

  int count = 123;
  String strCount = count.toString();
  print('strCount : ${strCount}');

  //상수
  final num1 = 100; //런타임 상수, 실행 시간에 결정
  const num2 = 200; //컴파일 타입 상수, 클래스 맴버로 사용

  final today = DateTime.now();
  print('today : ${today}');

  //문자열
  String hello = 'Hello dart';
  String wellcome = '''
  Welcome dart 
  Welcome world 
  Welcome flutter  
  ''';

  print(hello);
  print(wellcome);

  String escape = 'qqqqqqqqqq.\'dd\'ddddd';
  print(escape);

  String rawStr = r'\asdf\adf';
  print(rawStr);

  String fName ='길동';
  String lNmae = '홍';
  String fullName = lNmae + fName;
  print('이름 : ' + fullName);
  print('이름 : $lNmae$fName');

  String word = 'flutter';
  print('문자열 길이 : ${word.length}');
  print('첫번째 문자 : ${word[0]}');

  String text = ' dart language ';
  print('원본 : [$text]');
  print('소문자 : ${text.toLowerCase()}');
  print('대문자 : ${text.toUpperCase()}');
  print('공백 제거 : [${text.trim()}]');
  print('문자 포함 여부: [${text.contains('dart')}]');
  print('문자열 교체: [${text.replaceAll('dart', 'flutter')}]');

  String sentence = '서울,대전,대구,부산,광주';
  var cities = sentence.split(',');
  print("나눈 결과 : $cities");
  print("다시 합치기: ${cities.join('/')}");


}