import 'package:json_annotation/json_annotation.dart';
import 'package:web_app/features/auth/domain/entities/login/login_user_entity.dart';
import 'login_user_data.dart';

part 'login_user_model.g.dart';

@JsonSerializable()
class LoginUserModel extends LoginUserEntity{
  @JsonKey(name: 'access_token')
  final String access_token;
  @JsonKey(name: 'token_type')
  final String token_type;
  @JsonKey(name: 'user')
  final LoginUserData? user;

  LoginUserModel({
    required this.access_token,
    required this.token_type,
    required this.user,
  }):super(
    access_token: access_token,
    token_type: token_type,
    userDataEntity: user,
  );

  factory LoginUserModel.fromJson(Map<String,dynamic> json) => _$LoginUserModelFromJson(json);
  Map<String,dynamic> toJson() => _$LoginUserModelToJson(this);
}
