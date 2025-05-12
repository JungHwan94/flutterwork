/*
  * 연산
    - 몫 : ~/
    - 나머지는 java와 같음 : +=, -=, %=, ++, -- ..

  * 나눗셈 : int / int = double

  * ??=  : 만약 값이 null이면 오른쪽에 있는값을 넣고 그렇지 않으면 왼쪽의 값 넣기
 */
void main() {
  var result = 4 / 2;
  print(result);
  print(result.runtimeType);

  print('몫 : ${10 ~/ 3}');

  int? num = 2;
  print(num);
  num = null;
  print(num);

  num ??= 5;
  print('num = $num');

  num ??= 10;
  print('num = $num');

  /*
      ?: 자료형에 붙여줌
      ??: 변수에 붙여줌. 변수의 값이 변하지 않음
      ??=: 변수에 붙여줌. 변수에 값을 넣어줌. (null이면 오른쪽의 값을 그렇지 않은 원래값(왼쪽)을)
   */

  num = null;
  num ?? 5;
  print(num);
}