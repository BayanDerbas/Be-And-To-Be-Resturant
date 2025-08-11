part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  final int totalPrice;
  final int minOrderPrice;
  final List<String> coupons;
  final String? selectedCoupon;
  final String? tableNumber;
  final String? note;

  const CartState({
    required this.items,
    required this.totalPrice,
    required this.minOrderPrice,
    this.coupons = const ['10% خصم', 'توصيل مجاني', 'اشترِ 1 واحصل على 1 مجانًا'],
    this.selectedCoupon,
    this.tableNumber,
    this.note,
  });

  CartState copyWith({
    List<CartItem>? items,
    int? totalPrice,
    int? minOrderPrice,
    List<String>? coupons,
    String? selectedCoupon,
    String? tableNumber,
    String? note,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      minOrderPrice: minOrderPrice ?? this.minOrderPrice,
      coupons: coupons ?? this.coupons,
      selectedCoupon: selectedCoupon ?? this.selectedCoupon,
      tableNumber: tableNumber ?? this.tableNumber,
      note: note ?? this.note,
    );
  }

  @override
  List<Object?> get props => [items, totalPrice, minOrderPrice, coupons, selectedCoupon, tableNumber, note];
}