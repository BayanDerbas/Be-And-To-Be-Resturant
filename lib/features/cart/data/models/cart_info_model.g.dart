// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      cartInfo:
          (json['cart info'] as List<dynamic>?)
              ?.map((e) => CartInfoModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{'cart info': instance.cartInfo};

CartInfoModel _$CartInfoModelFromJson(Map<String, dynamic> json) =>
    CartInfoModel(
      (json['id'] as num?)?.toInt(),
      (json['user_id'] as num?)?.toInt(),
      (json['item_number'] as num?)?.toInt(),
      (json['total_price'] as num?)?.toInt(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
      (json['branch_id'] as num?)?.toInt(),
      (json['cartitems'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartInfoModelToJson(CartInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'item_number': instance.item_number,
      'total_price': instance.total_price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'branch_id': instance.branch_id,
      'cartitems': instance.cartitems?.map((e) => e.toJson()).toList(),
    };

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      (json['id'] as num?)?.toInt(),
      (json['type_id'] as num?)?.toInt(),
      (json['cart_id'] as num?)?.toInt(),
      (json['extra'] as num?)?.toInt(),
      (json['amount'] as num?)?.toInt(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['type'] == null
          ? null
          : TypeModel.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_id': instance.type_id,
      'cart_id': instance.cart_id,
      'extra': instance.extra,
      'amount': instance.amount,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'type': instance.type?.toJson(),
    };

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) => TypeModel(
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  (json['available'] as num?)?.toInt(),
  (json['price'] as num?)?.toInt(),
  (json['supportprice'] as num?)?.toInt(),
  (json['meal_id'] as num?)?.toInt(),
  json['created_at'] as String?,
  json['updated_at'] as String?,
  json['meal'] == null
      ? null
      : MealCartModel.fromJson(json['meal'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'available': instance.available,
  'price': instance.price,
  'supportprice': instance.supportprice,
  'meal_id': instance.meal_id,
  'created_at': instance.created_at,
  'updated_at': instance.updated_at,
  'meal': instance.meal?.toJson(),
};

MealCartModel _$MealCartModelFromJson(Map<String, dynamic> json) =>
    MealCartModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      maincategory_id: (json['maincategory_id'] as num?)?.toInt(),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$MealCartModelToJson(MealCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'maincategory_id': instance.maincategory_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
