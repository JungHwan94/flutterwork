void main() {
  List<String> blackPink = ['로제','지수','리사','제니'];

  final newBlackPink = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink);
  print(newBlackPink.toList());

  // (1.jpg, 3.jpg, 8.jpg, 2.jpg, 9.jpg)
  String number = '13829';
  List<String> img = number.split('').map((x) => '$x.jpg').toList();

  Map<String, String> herryPotter = {
    'Herry Potter' : '해리포터',
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저'
  };

  final result =  herryPotter.map((key, value) =>
    MapEntry('charcter $key', '해리포터 캐릭터 $value')
  );

  print(herryPotter);
  print(result);

  List<String> herryKeyList = herryPotter.keys.map((x) => 'charcter $x').toList();
  List<String> herryValueList = herryPotter.values.map((x) => '이름 $x').toList();
  print(herryKeyList);

  Set blackPinkSet = {'로제','지수','리사','제니'};
  // final newSet = blackPinkSet.map((x) => '블랙핑크 $x');    // 자료형 : Iterable<String>
  // final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();  // 자료형 : Set
  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toList();   // 자료형 : List
  print(newSet);
}