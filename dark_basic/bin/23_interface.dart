
void main() {
  BoyGroup bts = BoyGroup('BTS');
  GirlGroup redVelvet = GirlGroup('레드벨벳');

  bts.sayName();
  redVelvet.sayName();

  print(bts is IdolInterface);
  print(bts is BoyGroup);
}

abstract class IdolInterface {
  String name;
  IdolInterface(this.name);
  sayName();
}

class BoyGroup implements IdolInterface {
  String name;
  BoyGroup(this.name);

  @override
  sayName() {
    print('이름은 $name 입니다');
  }
}

class GirlGroup implements IdolInterface {
  String name;
  GirlGroup(this.name);

  @override
  sayName() {
    print('이름은 $name 입니다');
  }
}