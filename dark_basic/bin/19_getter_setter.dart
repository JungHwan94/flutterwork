/*
  - getter / setter
    변수처럼 사용
    : 단순한 값을 넣거나 가져올 때 사용
 */
void main() {
  Idol idol1 = Idol('블랙핑크', ['리사','로제','제니','지수']);

  print(idol1.firstMember);   // getter 출력

  // idol1.firstMember('나나');  함수가 아니라 이렇게 사용 안함
  idol1.firstMember = '나나';
  print(idol1.members);
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

  // getter
  String get firstMember {
    return members[0];
  }

  // setter : 무조건 하나의 파라미터만 받을 수 있다
  set firstMember(String name) {
    this.members[0] = name;
  }
}