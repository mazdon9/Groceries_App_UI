// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_a_cart_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateACartSchema _$UpdateACartSchemaFromJson(Map<String, dynamic> json) =>
    UpdateACartSchema(
      merge: json['merge'] as bool,
      products: (json['products'] as List<dynamic>)
          .map((e) => UpdateACartItemSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateACartSchemaToJson(UpdateACartSchema instance) =>
    <String, dynamic>{'merge': instance.merge, 'products': instance.products};

UpdateACartItemSchema _$UpdateACartItemSchemaFromJson(
  Map<String, dynamic> json,
) => UpdateACartItemSchema(
  id: (json['id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$UpdateACartItemSchemaToJson(
  UpdateACartItemSchema instance,
) => <String, dynamic>{'id': instance.id, 'quantity': instance.quantity};
