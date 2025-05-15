void main() {
  List<Map<String, String>> people = [
    {'name' : '로제', 'group' : '블랙핑크'},
    {'name' : '지수', 'group' : '블랙핑크'},
    {'name' : '정국', 'group' : 'BTS'},
    {'name' : '뷔', 'group' : 'BTS'}
  ];
  print(people);

  print('----------------------------');
  final pasePeople = people.map((x) => Person(name: x['name']!, group: x['group']!)).toList();
  print(pasePeople);
  print('----------------------------');
  final bts = pasePeople.where((x) => x.group == 'BTS');
  print(bts);
  print('=============================================================');

  // 위 2개를 한꺼번에
  final result = people.map((x) => Person(name: x['name']!, group: x['group']!))
      .where((x) => x.group == 'BTS')
      .fold<int>(0, (prev, next) => prev + next.name.length);
  print(result);

}

class Person {
  final String name;
  final String group;

  Person({required this.name, required this.group});

  @override
  String toString() {
    return 'Person(name:$name, group:$group)';
  }
}