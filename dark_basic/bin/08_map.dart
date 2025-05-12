void main() {
  Map<String, String> students = {
    '20250001' : '홍길동',
    '20250002' : '더조은',
    '20250003' : '임꺽정'
  };

  print(students);
  print(students['20250002']);

  // 맨 뒤에 추가
  students.addAll({'20250004' : '박강남'});
  print(students);

  // 값 변경
  students['20250003'] = 'BTS';
  print(students);

  // 키 or 값 가져오기
  print('keys : ${students.keys}');
  print('values : ${students.values}');
}