import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/confirm_delivery_entity.dart';

part 'confirm_delivery_model.g.dart';

@JsonSerializable()
class ConfirmDeliveryModel {
  @JsonKey(name: 'original_price')
  final int? originalPrice;

  final String? discount;

  @JsonKey(name: 'final_price')
  final int? finalPrice;

  @JsonKey(name: 'order info')
  final OrderInfoModel? orderInfo;

  @JsonKey(name: 'order details')
  final List<OrderDetailModel>? orderDetails;

  ConfirmDeliveryModel({
    this.originalPrice,
    this.discount,
    this.finalPrice,
    this.orderInfo,
    this.orderDetails,
  });

  factory ConfirmDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmDeliveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmDeliveryModelToJson(this);

  ConfirmDeliveryEntity toEntity() => ConfirmDeliveryEntity(
    originalPrice: originalPrice,
    discount: discount,
    finalPrice: finalPrice,
    orderInfo: orderInfo?.toEntity(),
    orderDetails:
    orderDetails?.map((e) => e.toEntity()).toList(growable: false) ?? [],
  );
}

@JsonSerializable()
class OrderInfoModel {
  final String? note;
  final String? address;
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @JsonKey(name: 'coupon_id')
  final String? couponId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'item_number')
  final int? itemNumber;
  @JsonKey(name: 'total_price')
  final int? totalPrice;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final int? id;

  @JsonKey(name: 'deliveryorderitem')
  final List<OrderDetailModel>? deliveryOrderItem;

  OrderInfoModel({
    this.note,
    this.address,
    this.branchId,
    this.couponId,
    this.userId,
    this.itemNumber,
    this.totalPrice,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.deliveryOrderItem,
  });

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInfoModelToJson(this);

  OrderInfoEntity toEntity() => OrderInfoEntity(
    note: note,
    address: address,
    branchId: branchId,
    couponId: couponId,
    userId: userId,
    itemNumber: itemNumber,
    totalPrice: totalPrice,
    updatedAt: updatedAt,
    createdAt: createdAt,
    id: id,
    deliveryOrderItem:
    deliveryOrderItem?.map((e) => e.toEntity()).toList(growable: false) ??
        [],
  );
}

@JsonSerializable()
class OrderDetailModel {
  final int? id;
  @JsonKey(name: 'type_id')
  final int? typeId;
  @JsonKey(name: 'delivery_order_id')
  final int? deliveryOrderId;
  final int? extra;
  final int? amount;
  final int? price;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  OrderDetailModel({
    this.id,
    this.typeId,
    this.deliveryOrderId,
    this.extra,
    this.amount,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);

  OrderDetailEntity toEntity() => OrderDetailEntity(
    id: id,
    typeId: typeId,
    deliveryOrderId: deliveryOrderId,
    extra: extra,
    amount: amount,
    price: price,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
