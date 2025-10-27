

// Future는 미래에 가져오는 값을 의미하는 객체
import 'dart:async';

Future<String> fetchData(){

  return Future.delayed(Duration(seconds: 3), (){
    return 'fetchdata';
  });
}

void main() async{

  // 비동기 작업 수행
  print('here..1');

  fetchData()
      .then((data){
        print('here..2 : $data');
  })
      .catchError((err){
        print('here..3: $err');
  })
      .whenComplete((){
        print('here..4 완');
  });

  print('here5 ');

  // async/ await 실행
  print('async_await--1');

  try {
    String data = await fetchData();
    print('async_await--2: $data');
  } catch(e){
    print('async_await--3: $e');
  } finally {
    print('async_await--4 완');
  }

  //stream 작업
  final controller = StreamController<String>();

  //stream 리스너 등록
  controller.stream.listen((data){
    print('stream-- 1: $data');
  }).onError((err){
    print('stream err');
  });

  //스트림 데이터 전송
  controller.sink.add('hello');
  controller.sink.add('wlcome');
  controller.sink.add('greetuig');
}