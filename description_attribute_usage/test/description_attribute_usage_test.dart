import 'package:description_attribute_usage/my_enum.dart';
import 'package:test/test.dart';

void main() {
  test('Description Attribute Test', () {
    var myEnum = MyEnum.hello;
    expect(myEnum.getDescription(), 'HellooooO!');
    myEnum = MyEnum.world;
    expect(myEnum.getDescription(), 'WoooooOOOOOOlD');
  });
}
