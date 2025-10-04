import 'package:equatable/equatable.dart';

class ConfirmDeliveryEntity extends Equatable {
  final int? originalPrice;
  final String? discount;
  final int? finalPrice;
  final OrderInfoEntity? orderInfo;
  final List<OrderDetailEntity> orderDetails;

  const ConfirmDeliveryEntity({
    this.originalPrice,
    this.discount,
    this.finalPrice,
    this.orderInfo,
    this.orderDetails = const [],
  });

  @override
  List<Object?> get props =>
      [originalPrice, discount, finalPrice, orderInfo, orderDetails];
}

class OrderInfoEntity extends Equatable {
  final String? note;
  final String? address;
  final int? branchId;
  final String? couponId;
  final int? userId;
  final int? itemNumber;
  final int? totalPrice;
  final String? updatedAt;
  final String? createdAt;
  final int? id;
  final List<OrderDetailEntity> deliveryOrderItem;

  const OrderInfoEntity({
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
    this.deliveryOrderItem = const [],
  });

  @override
  List<Object?> get props =>
      [note, address, branchId, couponId, userId, itemNumber, totalPrice, id];
}

class OrderDetailEntity extends Equatable {
  final int? id;
  final int? typeId;
  final int? deliveryOrderId;
  final int? extra;
  final int? amount;
  final int? price;
  final String? createdAt;
  final String? updatedAt;

  const OrderDetailEntity({
    this.id,
    this.typeId,
    this.deliveryOrderId,
    this.extra,
    this.amount,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, typeId, deliveryOrderId, extra, amount, price, createdAt, updatedAt];
}
