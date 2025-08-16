// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumberModel _$PhoneNumberModelFromJson(Map<String, dynamic> json) =>
    PhoneNumberModel(
      id: (json['id'] as num).toInt(),
      phone: json['phone'] as String?,
      branch_id: (json['branch_id'] as num).toInt(),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PhoneNumberModelToJson(PhoneNumberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'branch_id': instance.branch_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
