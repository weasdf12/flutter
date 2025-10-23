void hello(){
  print('hello dart');
}

int add(int a, int b){
  return a+b;
}

var greet = (String name){
  return "greeting ${name}";
};

int plus(int a, int b ) => a+b;
int minus(int a, int b ) => a-b;


int calc(int x, int y, int Function(int, int) operation){
  return operation(x,y);
}

Function createHello(String name){
  return ()=> 'Hello, ${name}';
}

//이름이 있는 매개변수 함수
void person1({String hello = 'hello', String? name}){
  print('person1 $hello, $name');
}
void person2(String name, {String? hello}){
  print('person1 $hello, $name');
}
void person3(String name, {String? hello,  required int age}){
  print('person1 $hello, $name, $age');
}

//선택적 위치 매개변수 함수
void user1(String name, [int age = 0]){
  print('user1 $name, $age');
}
void user2(String name, [int? age, String? address ]){
  print('user1 $name, $age, $address');
}
void user3(String name, [int age = 0, String address = 'Unknown' ,String? job]){
  print('user1 $name, $age, $address, $job');
}


void main(){
  // 기본 함수
  hello();

  // 매개변수와 반환값이 있는 함수
  int result1 = add(1, 2);
  int result2 = add(2, 3);

  print('result1 : ${result1}');
  print('result2 : ${result2}');

  // 익명 함수
  print(greet('asdf'));
  print(greet('fdsa'));

  // 화살표 함수(람다식)
  int rs1 = plus(2, 3);
  int rs2 = minus(2, 3);

  print("rs1 : ${rs1}");
  print('${rs2}');

  // 고차함수
  int result = calc(10, 5, minus);

  var greeting = createHello("wwee");
  print(greeting());

  // 이름이 있는 매개변수(named parameter ,{중괄호} 매개변수)
  person1();
  person1(name: 'ㅎㄱㄷ');
  person2('ㄱㅇㅅ');
  person2('ㄱㅊㅊ', hello: 'ㅎㅇ');
  person3('ㅈㅂㄱ',age: 11, hello: 'ㅎㅇ');

  // 선택적 위치 매개변수(optional positional parameter, [대괄호] 매개변수)
  user1('ㄱㅇㅅ');
  user1('ㄱㅊㅊ',11);
  user2('ㅈㅂㄱ');
  user2('ㄱㄱㅊ',23);
  user2('ㅇㅅㅅ',24,'ㅇㅇ');
  user3('ㅈㅇㅇ');
  user3('ㅈㅇㅇ',44,'ㅃ','ㅅㅅ');

}