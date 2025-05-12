/*
  - const 생성자 : 생성자 앞에 const 붙임. 나중에 값을 변경할 수 없음
 */
void main() {
  Idol idol1 = Idol('블랙핑크', ['리사','로제','제니','지수']);
  print(idol1.name);
  idol1.introduce();

  // idol1.name = '더조은';  나중에 바꿀 수 없음

  Idol idol2 = Idol.con([['정국','지민','뷔','진'],'BTS']);
  print(idol2.members);
  idol2.sayHello();
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