import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/update_count_cart_entity.dart';

part 'update_count_cart_model.g.dart';

@JsonSerializable()
class UpdateCountCartModel extends UpdateCountCartEntity {
  final String? message;

  UpdateCountCartModel({this.message}) : super(message: message);

  factory UpdateCountCartModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCountCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCountCartModelToJson(this);
}
