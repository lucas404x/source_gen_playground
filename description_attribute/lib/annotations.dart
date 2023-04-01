class DescriptionAttribute {
  /// Create a [description] to Enum. 
  /// The [DescriptionAttribute] needs to be declared both on Enum declaration and values. 
  /// Any description added to the declaration will be ignored in the generated method.
  /// 
  /// The name of the Enum value will be used in case of the value is not marked with [DescriptionAttribute].
  const DescriptionAttribute([this.description = '']);
  
  final String description;
}