// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) => MealModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  description: json['description'] as String,
  maincategory_id: (json['maincategory_id'] as num).toInt(),
);

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'description': instance.description,
  'maincategory_id': instance.maincategory_id,
};
