/// Support for doing something awesome.
///
/// More dartdocs go here.
library description_attribute;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/description_attribute_generator.dart';

Builder descriptionAttributeBuilder(BuilderOptions options) {
  return SharedPartBuilder([DescriptionAttributeGenerator()], "description_attribute");
}