void main(List<String> arguments) {
  var name = 'kim';
  var num = 5;
  // runtimeType: 자료형 출력
  print(name.runtimeType);
  print(num.runtimeType);

  print(name + '안녕');
  print(name + '${num}');
  print('${name}' + '${num}');
  print('${name} ${num}');
  
}
