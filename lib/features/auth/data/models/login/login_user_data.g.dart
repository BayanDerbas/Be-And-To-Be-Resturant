// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserData _$LoginUserDataFromJson(Map<String, dynamic> json) =>
    LoginUserData(
      id: (json['id'] as num).toInt(),
      fullname: json['fullname'] as String?,
      phonenumber: json['phonenumber'] as String?,
      role: json['role'] as String?,
      phone_verified_at: json['phone_verified_at'] as String?,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LoginUserDataToJson(LoginUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'phonenumber': instance.phonenumber,
      'role': instance.role,
      'phone_verified_at': instance.phone_verified_at,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
    };
