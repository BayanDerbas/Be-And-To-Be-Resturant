// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealTypeModel _$MealTypeModelFromJson(Map<String, dynamic> json) =>
    MealTypeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      available: (json['available'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      supportprice: (json['supportprice'] as num?)?.toInt(),
      meal_id: (json['meal_id'] as num).toInt(),
    );

Map<String, dynamic> _$MealTypeModelToJson(MealTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'available': instance.available,
      'price': instance.price,
      'supportprice': instance.supportprice,
      'meal_id': instance.meal_id,
    };
