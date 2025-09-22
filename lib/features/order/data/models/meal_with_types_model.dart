import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/order/domain/entities/meal_with_types_entity.dart';
import 'package:web_app/features/order/data/models/meal_type_model.dart';

part 'meal_with_types_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MealWithTypeModel extends MealWithTypesEntity {
  @override
  final List<MealTypeModel>? types;

  MealWithTypeModel({
    required int id,
    required String name,
    required String image,
    required String description,
    int? maincategory_id,
    this.types,
  }) : super(
    id,
    name,
    image,
    description,
    maincategory_id ?? 0,
    types,
  );

  factory MealWithTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MealWithTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealWithTypeModelToJson(this);
}
