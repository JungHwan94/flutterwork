/*
    - Null safety타입: 2.12 버전부터 도입
      null 값에 대한 안정성을 보장하기 위해 모든 변수는 nullable과 non-nullable로 구분

      1. Nullable Type: null을 허용하는 타입
         변수뒤에 ?를 붙여 활용
      2. Non-nullable Type: null을 허용하지 않음
         아무것도 붙이지 않는다
 */
void main() {
  String name = 'hong';
  print(name);
  // name = null; 오류 null 허용하지 않음

  String? name2 = 'git';
  name2 = null;
  print(name2);


  //print(name3);

  // 모든 자료형에 ?를 넣을 수 있다.
  int? num = 2;
  num = null;
  print(num);

  // !: nullable type으로 선언을 했을때 변수 뒤에 !를 붙여 null인 경우 오류를 발생하도록
  //    변수명에 !를 붙이면, Non-nullable의 타입
  String? name4 = 'dong';
  print(name4!);

  name4 = null;
  print(name4);
  // print(name4!); // 오류 TypeError

  int? num1;
  int num2 = 3;
  // print(num1 + num2); // 오류 null값 허용타입과 허용하지 않는 타입
  // print(num1! + num2); // build에서는 오류가 안뜨지만 실행시 오류

  // ??: null일때 대체값을 넣어줄 수 있음
  // print(num1 ?? 5); : num1의 값이 null이면 5로 대체하고, num1에 값이 들어있으면 num1 값을 그대로 사용
  print((num1 ?? 5) + num2);

  String? name5 = "john";
  if(name5 != null) {
    print(name5?.isNotEmpty);  // true
  }

  name5 = null;
  print(name5?.isEmpty);  // null
  print(name5?.isNotEmpty);  // null
}