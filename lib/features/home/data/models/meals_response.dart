import 'package:json_annotation/json_annotation.dart';
import 'meal_model.dart';

part 'meals_response.g.dart';

@JsonSerializable()
class MealsResponse {
  @JsonKey(name: 'All Meals')
  final List<MealModel> meals;

  MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsResponseToJson(this);
}
