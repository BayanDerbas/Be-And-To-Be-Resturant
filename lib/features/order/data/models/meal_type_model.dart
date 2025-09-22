import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/order/domain/entities/meal_type_entity.dart';

part 'meal_type_model.g.dart';

@JsonSerializable()
class MealTypeModel extends MealTypeEntity {
  const MealTypeModel({
    required int id,
    required String name,
    @JsonKey(defaultValue: 0) int? available,
    @JsonKey(defaultValue: 0) int? price,
    @JsonKey(defaultValue: 0) int? supportprice,
    required int meal_id,
  }) : super(
    id: id,
    name: name,
    available: available ?? 0,
    price: price ?? 0,
    supportprice: supportprice ?? 0,
    meal_id: meal_id,
  );

  factory MealTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MealTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealTypeModelToJson(this);
}
