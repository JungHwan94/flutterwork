/*
  - 객체 선언시 const가 없을 때 : 객체가 별도로 만들어짐.
  - 객체 선언시 const가 붙으면 : 하나만 객체가 만들어짐
 */
void main() {
  Idol idol1 = const Idol('블랙핑크', ['리사','로제','제니','지수']);
  Idol idol2 = const Idol('블랙핑크', ['리사','로제','제니','지수']);
  Idol idol3 = const Idol('BTS', ['정국','지민','뷔','진']);

  print(idol1 == idol2);  // true
  print(idol1 == idol3);  // false

  Idol idol4 = Idol('블랙핑크', ['리사','로제','제니','지수']);
  Idol idol5 = Idol('블랙핑크', ['리사','로제','제니','지수']);
  print(idol4 == idol5);  // flase
}

class Idol {
  final String name;
  final List<String> members;

  const Idol(this.name, this.members);

  Idol.con(List values)
      : this.members = values[0],
        this.name = values[1];

  sayHello() {
    print('안녕하세요 $name 입니다.');
  }

  introduce() {
    print('저의 멤버는 $members 입니다.');
  }
}