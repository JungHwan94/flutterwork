/*
  parameter (argment) : 순서와 갯수가 동일.
  optional parameter : 순서가 맞아야 됨. 파라미터의 갯수가 미지수일때
 */
void main() {
  function1();
  addNumbers(10, 23, 38);  // parameter (argment)
  addNumbers2(1,2,3);
  addNumbers2(1);
}

function1() {
  print('funcion1 실행');
}

// 3개의 숫자를 더해서 짝수인지 홀수 인지 알려주는 함수
addNumbers(int x, int y, int z) {
  int sum = x + y + z;

  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
}
/*
addNumbers2(int x, [int y, int z]) { // 파라미터가 안들어올 경우 null이되므로 오류
  int sum = x + y + z;
}
*/

/*
addNumbers2(int x, [int? y, int? z]) {
  int sum = x + y + z; // 오류 숫자 + null이기 때문
}
*/

// 파라미터가 미지수 일때 대괄호로 묶어준다
// 기본값을 넣어주면 값이 있으면 원래 값으로, 값이 없으면 기본값으로 넣어줌.
addNumbers2(int x, [int y = 23, int z = 30]) {
  int sum = x + y + z;
  if(sum % 2 == 0) {
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
  print(sum);
}