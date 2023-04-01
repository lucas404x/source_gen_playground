import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:description_attribute/annotations.dart';
import 'package:source_gen/source_gen.dart';

class DescriptionAttributeGenerator extends GeneratorForAnnotation<DescriptionAttribute>  {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! EnumElement) {
      throw Exception('The annotation is not attatched to Enum.');
    }

    final enumToDescription = <String, String>{};
    for (var field in element.fields.where((f) => f.isEnumConstant)) {      
      final descriptionAnnotation = _descriptionChecker.firstAnnotationOfExact(field);
      enumToDescription[field.displayName] = descriptionAnnotation?.getField('description')?.toStringValue() ?? field.displayName;
    }
    return _generateGetDescriptionMethod(element.name, enumToDescription);
  }

  String _generateGetDescriptionMethod(String enumTypeName, Map<String, String> enumToDescription) {
    final buf = StringBuffer();
    buf.writeln('String _\$getDescription($enumTypeName value) {');
    buf.writeln('switch (value) {');
    for (var entry in enumToDescription.entries) {
      buf.writeln('case $enumTypeName.${entry.key}:');
      buf.writeln('\treturn "${entry.value}";');
    }
    buf.writeln('}');
    buf.writeln('}');
    return buf.toString();
  }
}

const _descriptionChecker = TypeChecker.fromRuntime(DescriptionAttribute);