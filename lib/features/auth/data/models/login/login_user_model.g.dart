// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) =>
    LoginUserModel(
      access_token: json['access_token'] as String,
      token_type: json['token_type'] as String,
      user:
          json['user'] == null
              ? null
              : LoginUserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginUserModelToJson(LoginUserModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'user': instance.user,
    };
