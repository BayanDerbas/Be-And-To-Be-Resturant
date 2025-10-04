// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmDeliveryModel _$ConfirmDeliveryModelFromJson(
  Map<String, dynamic> json,
) => ConfirmDeliveryModel(
  originalPrice: (json['original_price'] as num?)?.toInt(),
  discount: json['discount'] as String?,
  finalPrice: (json['final_price'] as num?)?.toInt(),
  orderInfo:
      json['order info'] == null
          ? null
          : OrderInfoModel.fromJson(json['order info'] as Map<String, dynamic>),
  orderDetails:
      (json['order details'] as List<dynamic>?)
          ?.map((e) => OrderDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ConfirmDeliveryModelToJson(
  ConfirmDeliveryModel instance,
) => <String, dynamic>{
  'original_price': instance.originalPrice,
  'discount': instance.discount,
  'final_price': instance.finalPrice,
  'order info': instance.orderInfo,
  'order details': instance.orderDetails,
};

OrderInfoModel _$OrderInfoModelFromJson(Map<String, dynamic> json) =>
    OrderInfoModel(
      note: json['note'] as String?,
      address: json['address'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      couponId: json['coupon_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      itemNumber: (json['item_number'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      deliveryOrderItem:
          (json['deliveryorderitem'] as List<dynamic>?)
              ?.map((e) => OrderDetailModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$OrderInfoModelToJson(OrderInfoModel instance) =>
    <String, dynamic>{
      'note': instance.note,
      'address': instance.address,
      'branch_id': instance.branchId,
      'coupon_id': instance.couponId,
      'user_id': instance.userId,
      'item_number': instance.itemNumber,
      'total_price': instance.totalPrice,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'deliveryorderitem': instance.deliveryOrderItem,
    };

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    OrderDetailModel(
      id: (json['id'] as num?)?.toInt(),
      typeId: (json['type_id'] as num?)?.toInt(),
      deliveryOrderId: (json['delivery_order_id'] as num?)?.toInt(),
      extra: (json['extra'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_id': instance.typeId,
      'delivery_order_id': instance.deliveryOrderId,
      'extra': instance.extra,
      'amount': instance.amount,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
