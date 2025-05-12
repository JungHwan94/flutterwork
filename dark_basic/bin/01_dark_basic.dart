/*
  * 자료형
    1. bool(boolean이 아님) && , ||
    2. int ( 다른언어와 다른점 :  int / int = double )
    3. double(float 없음)
    4. String : "", '' 모두 다 됨
    5. Null : null을 넣을 수 있음

   * print(같은 자료형만 넣을 수 있음)
 */
void main(List<String> arguments) {
  // var은 처음 넣은 값의 자료형이 변수의 자료형이 됨
  var name = 'kim';
  var num = 5;
  // runtimeType : 자료형 출력
  print(name.runtimeType);
  print(num.runtimeType);

  print(name + '안녕');
  // 자료형이 다를 때는 따옴표를 반드시 넣어야 한다
  print(name + '${num}');
  print('${name}' + '${num}');
  print('${name} ${num}');

  // 중괄호 생략 가능. 문서에서도 권장
  print('$name $num');
  print('$name' + '$num');

  // 중괄호를 생략하면 .runtimeType은 문자열로 인식
  print('$num.runtimeType $num');
  print('${num.runtimeType} $num');
}