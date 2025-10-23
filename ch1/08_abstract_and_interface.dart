// 추상클래스
abstract class Animal{

  String name;

  Animal(this.name);

  //추상 메소드
  void speak();

  void hello(){
    print('$name');
  }
}

class Dog extends Animal{
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void speak() {
    print('$name($breed) 왈');
  }

}

//인터페이스, dart 에서는 모든 클래스가 암묵적으로 interface, implements로 구현
abstract class Vehicle {
  void start();
  void stop();
}

class Car implements Vehicle{

  String _brand;

  Car(this._brand);

  @override
  void start() {
    print("$_brand start");
  }

  @override
  void stop() {
    print("$_brand stop");
  }

}

// 믹스인(Mixin)
mixin Swimmable {
  void swim(){
    print('swim');
  }
}
mixin Flyable{
  void fly(){
    print("fly");
  }
}
mixin Walkable{
  void walk(){
    print("walk");
  }
}

class Duck extends Animal with Swimmable, Flyable, Walkable{
  Duck(String name) : super(name);

  @override
  void speak() {
    print('오리날다');
  }

}

void main(){

  //추상클래스
  Animal animal = Dog('개','df');
  animal.speak();

  //인터페이스
  Vehicle car = Car('car');
  car.start();
  car.stop();

  //믹스인
  Duck duck = Duck("오리");
  duck.speak();
  duck.swim();
  duck.fly();
  duck.walk();
}