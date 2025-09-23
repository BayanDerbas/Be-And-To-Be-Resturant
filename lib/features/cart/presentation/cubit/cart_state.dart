part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {
  final List<CartItem> items;
  final int totalPrice;
  final int minOrderPrice;
  final String? selectedCoupon;
  final String? tableNumber;
  final String? note;
  final List<String> coupons;

  CartInitial({
    this.items = const [],
    this.totalPrice = 0,
    this.minOrderPrice = 50,
    this.selectedCoupon,
    this.tableNumber,
    this.note,
    this.coupons = const [],
  });

  CartInitial copyWith({
    List<CartItem>? items,
    int? totalPrice,
    int? minOrderPrice,
    String? selectedCoupon,
    String? tableNumber,
    String? note,
    List<String>? coupons,
  }) {
    return CartInitial(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      minOrderPrice: minOrderPrice ?? this.minOrderPrice,
      selectedCoupon: selectedCoupon ?? this.selectedCoupon,
      tableNumber: tableNumber ?? this.tableNumber,
      note: note ?? this.note,
      coupons: coupons ?? this.coupons,
    );
  }

  @override
  List<Object?> get props => [items, totalPrice, minOrderPrice, selectedCoupon, tableNumber, note, coupons];
}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final AddToCartResponseEntity entity;

  CartSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object?> get props => [message];
}
