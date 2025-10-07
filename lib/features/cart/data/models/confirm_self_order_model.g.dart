// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_self_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmSelfOrderModel _$ConfirmSelfOrderModelFromJson(
  Map<String, dynamic> json,
) => ConfirmSelfOrderModel(
  originalPriceModel: (json['original_price'] as num?)?.toInt(),
  discount: json['discount'] as String?,
  finalPriceModel: (json['final_price'] as num?)?.toInt(),
  orderInfoModel:
      json['order info'] == null
          ? null
          : OrderInfoModel.fromJson(json['order info'] as Map<String, dynamic>),
  orderDetailsModel:
      (json['order details'] as List<dynamic>?)
          ?.map((e) => SelfOrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ConfirmSelfOrderModelToJson(
  ConfirmSelfOrderModel instance,
) => <String, dynamic>{
  'original_price': instance.originalPriceModel,
  'discount': instance.discount,
  'final_price': instance.finalPriceModel,
  'order info': instance.orderInfoModel?.toJson(),
  'order details': instance.orderDetailsModel?.map((e) => e.toJson()).toList(),
};

OrderInfoModel _$OrderInfoModelFromJson(Map<String, dynamic> json) =>
    OrderInfoModel(
      note: json['note'] as String?,
      branchIdModel: (json['branch_id'] as num?)?.toInt(),
      couponIdModel: json['coupon_id'] as String?,
      userIdModel: (json['user_id'] as num?)?.toInt(),
      itemNumberModel: (json['item_number'] as num?)?.toInt(),
      totalPriceModel: (json['total_price'] as num?)?.toInt(),
      updatedAtModel: json['updated_at'] as String?,
      createdAtModel: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      selfOrderItemsModel:
          (json['selforderitem'] as List<dynamic>?)
              ?.map(
                (e) => SelfOrderItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$OrderInfoModelToJson(OrderInfoModel instance) =>
    <String, dynamic>{
      'note': instance.note,
      'branch_id': instance.branchIdModel,
      'coupon_id': instance.couponIdModel,
      'user_id': instance.userIdModel,
      'item_number': instance.itemNumberModel,
      'total_price': instance.totalPriceModel,
      'updated_at': instance.updatedAtModel,
      'created_at': instance.createdAtModel,
      'id': instance.id,
      'selforderitem':
          instance.selfOrderItemsModel?.map((e) => e.toJson()).toList(),
    };

SelfOrderItemModel _$SelfOrderItemModelFromJson(Map<String, dynamic> json) =>
    SelfOrderItemModel(
      id: (json['id'] as num?)?.toInt(),
      typeIdModel: (json['type_id'] as num?)?.toInt(),
      selfOrderIdModel: (json['self_order_id'] as num?)?.toInt(),
      extra: (json['extra'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      createdAtModel: json['created_at'] as String?,
      updatedAtModel: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SelfOrderItemModelToJson(SelfOrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_id': instance.typeIdModel,
      'self_order_id': instance.selfOrderIdModel,
      'extra': instance.extra,
      'amount': instance.amount,
      'price': instance.price,
      'created_at': instance.createdAtModel,
      'updated_at': instance.updatedAtModel,
    };
