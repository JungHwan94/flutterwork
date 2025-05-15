/*
  - Future와  Stream 비동기 처리시 사용
    다른 점 : Future -> 딱 1번만 받아옴
             Stream -> 여러번 받아옴
    - async / await / Future : 1회만 응답을 받을 때(동기처리)
    - async* / yield / Stream : 지속적으로 응답을 받을 때

    * Future(javascript Promise와 동일)
      싱글스레드 환경에서 비동기 처리를 함.
      - 미래에 완료될 작업을 나타내는 객체(나중에 결과 받기)
 */
void main() {
  Future<String> name = Future.value('tjoeun');
  Future<int> num = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers(1, 2);
  addNumbers(4, 2);
  /*
  print('함수 시작');

  // Future.delayed(지연할시간(기간), 지연시간이 지난후 실행할 함수);
  Future.delayed(Duration(seconds: 2), () {
    print('Delay 끝');
  });
  */
}

addNumbers(int num1, int num2) {
  print('계산 시작 : $num1 + $num2');

  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $num1 + $num2 = ${num1+num2}');
  });

  print('함수 끝');
}