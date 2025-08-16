import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_entity.g.dart';

@JsonSerializable()
class LogoutEntity extends Equatable {
  final String? message;

  LogoutEntity({required this.message});

  factory LogoutEntity.fromJson(Map<String,dynamic> json) => _$LogoutEntityFromJson(json);
  Map<String,dynamic> toJson() => _$LogoutEntityToJson(this);

  @override
  List<Object?> get props => [message];
}