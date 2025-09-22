// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_with_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealWithTypeModel _$MealWithTypeModelFromJson(Map<String, dynamic> json) =>
    MealWithTypeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      maincategory_id: (json['maincategory_id'] as num?)?.toInt(),
      types:
          (json['types'] as List<dynamic>?)
              ?.map((e) => MealTypeModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MealWithTypeModelToJson(MealWithTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'maincategory_id': instance.maincategory_id,
      'types': instance.types?.map((e) => e.toJson()).toList(),
    };
