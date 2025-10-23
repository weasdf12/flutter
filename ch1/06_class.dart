class Person{
  String? name;
  int? age;

  void introduce(){
    print('$name,$age');
  }
}

class User{
  String _name;
  String _birth;
  int? _age;

  static int total = 0;

  late String _email;


  User(this._name, this._birth);

  User.withAge(String name, String birth, int age)
      : this._name = name , this._birth = birth, this._age= age {
    total++;
    print('User.withAge 호출');
  }

  User.guest(this._name) : this._birth = 'UnKnown', this._age = 0;

  static final Map<String, User> _cache = {};

  factory User.createUser(String name, String birth){
    if(_cache.containsKey(name)){
      return _cache[name]!; // 캐시에서 객체 반환
    }else{
      var newUser = User(name, birth);
      _cache[name] = newUser; //캐시 저장
      return newUser;
    }
  }

  String get name => _name;
  String get birth => _birth;
  int? get age => _age;

  set name(String name){
    _name = name;
  }

  set birth(String birth){
    _birth = birth;
  }

  set age(int age){
    age = age;
  }


  void hello(){
    print('$_name,$_birth,$_age,$_email');
  }

  void initEmail(String value){
    if(value.contains('@')){
      _email = value;
    }else{
      print('이메일 형식 아님');
    }
  }


  @override
  String toString() {
    return super.toString();
  }
}


void main(){

  Person person1 = Person();
  person1.name ='asdf';
  person1.age= 11;
  person1.introduce();

  Person person2 = Person()
  ..name='asdf'
  ..age = 11
  ..introduce();

  var user1 = User('ㅎㄱㄷ','1234');
  user1.initEmail('dfddf@ksks.com');
  user1.hello();

  print('${user1.name}');
  print('${user1.age}');

  user1.age=30;
  print(user1);

  var user2 = User.withAge('ㄱㅇㅅ', '1234', 123);
  user2.initEmail('asdf@dfsa.com');
  user2.hello();

  var user3 = User.guest('ㄱㅊㅊ');
  user3.initEmail("efaf@fww.com");
  user3.hello();

  var user4 = User.withAge('ㄱㅇㅅ', '1234', 123);
  user4.initEmail('asdf@dfsa.com');
  user4.hello();

  print('total: ${User.total}');

}