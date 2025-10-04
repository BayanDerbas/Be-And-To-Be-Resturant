part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {
  final int? id;
  final List<CartItem> items;
  final int totalPrice;
  final int minOrderPrice;
  final String? selectedCoupon;
  final String? tableNumber;
  final String? note;
  final List<String> coupons;
  final String? address;

  CartInitial({
    this.id,
    this.items = const [],
    this.totalPrice = 0,
    this.minOrderPrice = 50,
    this.selectedCoupon,
    this.tableNumber,
    this.note,
    this.coupons = const [],
    this.address
  });

  CartInitial copyWith({
    List<CartItem>? items,
    int? totalPrice,
    int? minOrderPrice,
    String? selectedCoupon,
    String? tableNumber,
    String? note,
    List<String>? coupons,
    String? address,
  }) {
    return CartInitial(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      minOrderPrice: minOrderPrice ?? this.minOrderPrice,
      selectedCoupon: selectedCoupon ?? this.selectedCoupon,
      tableNumber: tableNumber ?? this.tableNumber,
      note: note ?? this.note,
      coupons: coupons ?? this.coupons,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [items, totalPrice, minOrderPrice, selectedCoupon, tableNumber, note, coupons,address];
}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final AddToCartResponseEntity entity;

  CartSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class CartInfoSuccess extends CartState {
  final List<CartInfoEntity> entity;
  CartInfoSuccess(this.entity);
  @override
  List<Object?> get props => [entity];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object?> get props => [message];
}