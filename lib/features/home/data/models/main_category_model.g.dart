// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainCategoryModel _$MainCategoryModelFromJson(Map<String, dynamic> json) =>
    MainCategoryModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['image'] as String,
      (json['branch_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$MainCategoryModelToJson(MainCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'branch_id': instance.branch_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

MainCategoriesResponse _$MainCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => MainCategoriesResponse(
  allCategories:
      (json['All Categories'] as List<dynamic>)
          .map((e) => MainCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MainCategoriesResponseToJson(
  MainCategoriesResponse instance,
) => <String, dynamic>{'All Categories': instance.allCategories};
