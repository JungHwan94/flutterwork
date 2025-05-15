/*
  - private : _(언더바)를 붙이면 private
 */
void main() {
  _Idol idol1 = _Idol('블랙핑크', ['리사','로제','제니','지수']);

  idol1._sayHello();
  print(idol1._name);
  print(idol1._members);
}

// class 앞에 _를 붙이면 현재파일에서만 사용가능
class _Idol {
  String _name;
  List<String> _members;

  _Idol(this._name, this._members);

  _Idol.con(List values)
      : this._members = values[0],
        this._name = values[1];

  _sayHello() {
    print('안녕하세요 $_name 입니다.');
  }

  introduce() {
    print('저의 멤버는 $_members 입니다.');
  }

  // getter
  String get firstMember {
    return _members[0];
  }

  // setter : 무조건 하나의 파라미터만 받을 수 있다
  set firstMember(String name) {
    this._members[0] = name;
  }
}