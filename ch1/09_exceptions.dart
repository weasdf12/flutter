
void main(){

  //예외처리 기본
  try{
    int result = 10 ~/ 0;
    print(result);
  }catch(e){
    print(e);
  }

  //특정 예외처리
  try{
    String input = 'abc';
    int num = int.parse(input);
    print(num);
  }on FormatException{
    print('형식 예외');
  } catch(e){
    print(e);
  }

  //finally
  try{
    String input = 'abc';
    int num = int.parse(input);
    print(num);
  }on FormatException{
    print('형식 예외');
  } catch(e){
    print(e);
  } finally {
    print('작업 완');
  }

  //사용자 정의 예외
  //checkAge(-10);
  //checkAge(9);
  checkAge(11);
}

class MyException implements Exception{
  final String message;
  MyException(this.message);

  @override
  String toString(){
    return 'MyException : $message' ;
  }
}
void checkAge(int age){
  if(age < 0){
    throw MyException('나이 음수 안됨');
  } else if(age < 10){
    throw MyException('민자 나가라');
  }
  print(age);
}