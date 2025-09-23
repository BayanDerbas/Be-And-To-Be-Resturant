// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseModel _$AddToCartResponseModelFromJson(
  Map<String, dynamic> json,
) => AddToCartResponseModel(
  messages:
      (json['messages'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AddToCartResponseModelToJson(
  AddToCartResponseModel instance,
) => <String, dynamic>{'messages': instance.messages};
