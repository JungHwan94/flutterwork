/*
  named parameter : 이름이 있는 파라미터. 순서가 필요 없음
 */
void main() {
  addNumbers(y: 10, x: 5, z: 20);
  addNumbers2(y: 10, x: 5);
  addNumbers2(y: 10, x: 5, z: 20);

  print(addNumbers3(y: 10, x: 20));
  print('----------------------------');

  addNumbers4(20, z: 30 ,y: 60);
  print('----------------------------');
  addNumbers4(100, y: 50);
  print('----------------------------');
  addNumbers4(200, y: 50, z : 40);
}
// 파라미터 넣는 곳을 {}중괄호로 묶고, required 키워드를 붙여준다
addNumbers({
  required int x,
  required int y,
  required int z
}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  print(sum);
}

addNumbers2({
  required int x,
  required int y,
  int z = 50  // required를 빼고 기본값을 넣어주면 optional parameter(값이 들엉와도 되고, 안들어와도 되고)
}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  print(sum);
}

// return이 있는 함수
int addNumbers3({
  required int x,
  required int y,
  int z = 50  // required를 빼고 기본값을 넣어주면 optional parameter(값이 들엉와도 되고, 안들어와도 되고)
}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  return sum;
}

int addNumbers4(int x, {required int y, int z = 50}) {
  int sum = x + y + z;
  print('x : $x');
  print('y : $y');
  print('z : $z');
  return sum;
}

int addNumbers5(int x, {required int y, int z = 50}) {
  int sum = x + y + z;
  return sum;
}

// addNumbers5를 화살표 함수로
int addNumbers6(int x, {required int y, int z = 50}) => x + y + z;