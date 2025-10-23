
import '05_functions.dart';

class Animal{
  String _name;

  Animal(this._name);

  void speak(){
    print("$_name");
  }

  void move(){
    print("$_name");
  }
}

class Dog extends Animal{
  String _breed;
  Dog(String name, this._breed) : super(name);

  @override
  void speak(){
    print('$_name($_breed) 왈');
  }

  void walk(){
    print('$_name($_breed) 산책');
  }

}

class Cat extends Animal{
  String _breed;
  Cat(String name, this._breed) : super(name);

  @override
  void speak(){
    print('$_name($_breed) 냥');
  }

  void walk(){
    print('$_name($_breed) 꾹꾹이');
  }

}


void main(){

  // Animal 생성
  Animal animal = Animal('동물');
  animal.speak();
  animal.move();

  //dog
  Dog myDog = Dog('루비', '시츄');
  myDog.speak();
  myDog.walk();

  Cat myCay = Cat('a', 'aa');
  myCay.speak();
  myCay.walk();

  //다형성
  Animal a1 = Dog('we', 'aa');
  Animal a2 = Cat('fw', 'add');

  a1.speak();
  a2.speak();

  if(a1 is Dog){
    a1.walk();
  }

  if(a2 is Cat){
    a2.walk();
  }

}