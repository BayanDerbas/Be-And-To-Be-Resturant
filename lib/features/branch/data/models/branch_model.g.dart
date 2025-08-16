// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
  id: (json['id'] as num).toInt(),
  branch_name: json['branch_name'] as String?,
  image: json['image'] as String?,
  length: (json['length'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  facebooktoken: json['facebooktoken'] as String?,
  instagramtoken: json['instagramtoken'] as String?,
  created_at: json['created_at'] as String?,
  updated_at: json['updated_at'] as String?,
  phonenumbers:
      (json['phonenumbers'] as List<dynamic>)
          .map((e) => PhoneNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branch_name,
      'image': instance.image,
      'length': instance.length,
      'width': instance.width,
      'facebooktoken': instance.facebooktoken,
      'instagramtoken': instance.instagramtoken,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'phonenumbers': instance.phonenumbers,
    };
