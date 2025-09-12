import 'package:json_annotation/json_annotation.dart';
part 'update_a_cart_schema.g.dart';

@JsonSerializable()
class UpdateACartSchema {
  final bool merge;
  final List<UpdateACartItemSchema> products;

  UpdateACartSchema({required this.merge, required this.products});

  factory UpdateACartSchema.fromJson(Map<String, dynamic> json) =>
      _$UpdateACartSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateACartSchemaToJson(this);
}

@JsonSerializable()
class UpdateACartItemSchema {
  final int id;
  final int quantity;

  UpdateACartItemSchema({required this.id, required this.quantity});

  factory UpdateACartItemSchema.fromJson(Map<String, dynamic> json) =>
      _$UpdateACartItemSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateACartItemSchemaToJson(this);
}
