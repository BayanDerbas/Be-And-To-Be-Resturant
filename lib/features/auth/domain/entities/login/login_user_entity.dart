import 'package:equatable/equatable.dart';

import 'login_user_data_entity.dart';

class LoginUserEntity extends Equatable {
  final String access_token;
  final String token_type;
  final LoginUserDataEntity? userDataEntity;

  LoginUserEntity({
    required this.access_token,
    required this.token_type,
    required this.userDataEntity,
  });

  factory LoginUserEntity.fromJson(Map<String, dynamic> json) {
    return LoginUserEntity(
      access_token: json['access_token'] ?? '',
      token_type: json['token_type'] ?? '',
      userDataEntity: json['user'] != null
          ? LoginUserDataEntity.fromJson(json['user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'access_token': access_token,
    'token_type': token_type,
    'user': userDataEntity?.toJson(),
  };

  @override
  List<Object?> get props => [access_token, token_type, userDataEntity];
}