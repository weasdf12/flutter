class Box<T> {

  T item;

  Box(this.item);

  T getItem(){
    return item;
  }
}

void main() {

  // 제네릭 객체 생성
  Box stringBox = Box<String>('hello');
  String text = stringBox.getItem();
  print('text : $text');

  Box intBox = Box<int>(100);
  int num = intBox.getItem();
  print('num : $num');

  ///////////////////////////
  // List
  ///////////////////////////
  // List 생성
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  print('fruits : $fruits');

  // 원소 추가
  fruits.add('Durian');
  print('fruits : $fruits');

  //원소 추가
  fruits.add('Durian');
  print('fruits : $fruits');

  //원소 참조
  print('1: ${fruits[0]}');
  print('2: ${fruits.first}');
  print('3: ${fruits.last}');

  //원소 수정
  fruits[1]='berry';
  print('fru: $fruits');

  //원소 제거
  String removedFruit = fruits.removeAt(0);
  print('remove: $removedFruit');
  print('fruits: $fruits');

  //리스트 크기
  print('개수 :${fruits.length}');

  //리시트 반복문
  for(String fruits in fruits){
    print('과일 : $fruits');
  }

  //리스트 필터링
  List<int> numbers = [1,2,3,4,5];
  var evenNumbers = numbers.where((n) => n% 2 == 0);
  print('짝수 : $evenNumbers');

  //변환
  var doubledList = numbers.map((n)=> n * 2).toList();
  print('doubleList : $doubledList');

  // 정렬
  numbers.sort();
  //numbers.sort((a, b) => a.compareTo(b));
  print('ㅇ름차순 : $numbers');

  numbers.sort((a, b) => b.compareTo(a));
  print('내림차순 : $numbers');

  //반복처리
  numbers.forEach((n) => print('n : $n'));

  ///////////////////////////////////
  ////set, 중복 제거 자료 구조
  ///////////////////////////////////

  Set<String> colors = {'red','green','blue'};
  print('colcor : $colors');

  // 원소 추가
  colors.add('orange');
  colors.add('red'); // 무시됨
  print('colcor : $colors');

  // 집합 연산(합집합)
  var set1 = {1,2,3,4};
  var set2 = {3,4,5,6};

  Set<int> unionSet = set1.union(set2);
  print('합ㅈ빟바 : $unionSet');

  // 교집합
  Set<int> intersectSet = set1.intersection(set2);
  print('교집합: $intersectSet');

  // 차집합
  Set<int> asdf = set1.difference(set2);
  print('차집 : $asdf');


  ///////////////////////////////////
  ////map
  ///////////////////////////////////

  // 맵 생성
  Map<String, String> user = {
    'id': 'a101',
    'name': 'ㅎㄱㄷ',
    'addr': '부산',
  };

  print('user : $user');

  // 맵 키 참조
  print('이름 : ${user['name']}');
  print('주소 : ${user['addr']}');

  // 키 존재 여부
  print('age키 존재 : ${user.containsKey('age')}');

  // 모든 키, 값 리스트 생성
  print('모든 키 목록 : ${user.keys.toList()}');
  print('모든 값 목록 : ${user.values.toList()}');



}