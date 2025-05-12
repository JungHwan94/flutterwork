/*
  - var 타입 : 처음 들어온 값이 type이 됨. 처음 타입이 정해지면 바꿀수 없음.
  - dynamic 타입 : 처음 들어온 값이 type이 됨. 처음 타입과 상관없이 타입을 바꿀수 있음.
 */
void main() {
  dynamic name = 'kim';
  print(name.runtimeType);

  name = 5;
  print(name.runtimeType);

  var name2 = 'ji';
  // name2 = 7;  오류
}