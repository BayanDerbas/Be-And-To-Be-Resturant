import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/add_to_cart_response_entity.dart';

part 'add_to_cart_response_model.g.dart';

@JsonSerializable()
class AddToCartResponseModel extends AddToCartResponseEntity {
  final List<String> messages;

  AddToCartResponseModel({required this.messages})
      : super(messages: messages);

  factory AddToCartResponseModel.fromJson(dynamic json) {
    if (json is List) {
      return AddToCartResponseModel(
        messages: List<String>.from(json),
      );
    } else if (json is Map<String, dynamic> && json['messages'] != null) {
      return AddToCartResponseModel(
        messages: List<String>.from(json['messages']),
      );
    } else {
      return AddToCartResponseModel(messages: []);
    }
  }

  Map<String, dynamic> toJson() => {'messages': messages};
}