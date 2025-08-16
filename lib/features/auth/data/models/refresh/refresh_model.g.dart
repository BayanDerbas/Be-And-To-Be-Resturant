// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshModel _$RefreshModelFromJson(Map<String, dynamic> json) => RefreshModel(
  access_token: json['access_token'] as String?,
  token_type: json['token_type'] as String?,
  expires_in: (json['expires_in'] as num?)?.toInt(),
);

Map<String, dynamic> _$RefreshModelToJson(RefreshModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
    };
