
void main() {
  ///////////////////////
  // 조건문
  ///////////////

  int number = 10;
  if (number > 5) {
    print("num은 5보다 크다");
  }

  if (number % 2 == 0) {
    print("$number 는 짝수");
  } else {
    print("$number 는 홀수");
  }

  int score = 85;
  if (score >= 90) {
    print("a 학점");
  } else if (score >= 80) {
    print("b 학점");
  } else if (score >= 70) {
    print("c 학점");
  } else {
    print("f");
  }


  //switch

  switch (score ~/ 10) {
    case 10:
    case 9:
      print("a");
      break;
    case 8:
      print("b");
      break;
    case 7:
      print("c");
      break;
    case 6:
      print("d");
      break;
    default:
      print("f");
  }

  ///////////////////////
  // 반복문
  ///////////////

  for (int i = 1; i <= 5; i++) {
    print("for문 반복 : $i");
  }

  int j = 1;
  while (j <= 5) {
    print("do-while문 반복 : $j");
    j++;
  }

  int k = 1;
  do {
    print("do-while문 반복: $k");
    k++;
  } while (k <= 5);

  int num = 1;
  while (true) {
    if (num % 5 == 0 && num % 7 == 0){
      print("i가 5라 반복문 종료");
    break;
  }
  num++;
}
print('num : ${num}');

  for (int i = 1 ; i <= 10; i++){
    if (i % 2 == 0){
      continue;
    }
    print("i = $i");
  }

// 별 삼각형
 for(int a= 1 ; a <= 10; a ++){
   String line = '';
   for(int b=1; b<=a ; b++){

     line += '★';
   }
   print(line);
 }
}