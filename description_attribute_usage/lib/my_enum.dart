import 'package:description_attribute/annotations.dart';

part 'my_enum.g.dart';

@DescriptionAttribute()
enum MyEnum {
  @DescriptionAttribute('HellooooO!')
  hello,
  @DescriptionAttribute('WoooooOOOOOOlD')
  world,
  @DescriptionAttribute('HellooooO!2')
  hello2,
  @DescriptionAttribute('WoooooOOOOOOlD2')
  world2,
  @DescriptionAttribute('HellooooO!1')
  hello1,
  @DescriptionAttribute('WoooooOOOOOOlD3')
  world3;

  String getDescription() => _$getDescription(this);
}