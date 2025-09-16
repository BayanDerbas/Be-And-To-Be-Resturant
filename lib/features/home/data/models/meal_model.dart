import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/home/domain/entites/meal_entity.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealModel extends MealEntity {
  MealModel({
    required super.id,
    required super.name,
    required super.image,
    required super.description,
    required super.maincategory_id,
  });
  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}
