// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsResponse _$MealsResponseFromJson(Map<String, dynamic> json) =>
    MealsResponse(
      meals:
          (json['All Meals'] as List<dynamic>)
              .map((e) => MealModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MealsResponseToJson(MealsResponse instance) =>
    <String, dynamic>{'All Meals': instance.meals};
