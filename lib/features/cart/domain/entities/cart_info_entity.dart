import 'package:equatable/equatable.dart';

class CartInfoEntity extends Equatable {
  final int? id;
  final int? user_id;
  final int? item_number;
  final int? total_price;
  final String? created_at;
  final String? updated_at;
  final int? branch_id;
  final List<CartItemEntity>? cartitems;

  CartInfoEntity(
    this.id,
    this.user_id,
    this.item_number,
    this.total_price,
    this.created_at,
    this.updated_at,
    this.branch_id,
    this.cartitems,
  );

  @override
  List<Object?> get props => [
    id,
    user_id,
    item_number,
    total_price,
    created_at,
    updated_at,
    branch_id,
    cartitems,
  ];
}

class CartItemEntity extends Equatable {
  final int? id;
  final int? type_id;
  final int? cart_id;
  final int? extra;
  final int? amount;
  final String? created_at;
  final String? updated_at;
  final TypeEntity? type;

  CartItemEntity(
    this.id,
    this.type_id,
    this.cart_id,
    this.extra,
    this.amount,
    this.created_at,
    this.updated_at,
    this.type,
  );
  @override
  List<Object?> get props => [
    id,
    type_id,
    cart_id,
    extra,
    amount,
    created_at,
    updated_at,
    type,
  ];
}

class TypeEntity extends Equatable {
  final int? id;
  final String? name;
  final int? available;
  final int? price;
  final int? supportprice;
  final int? meal_id;
  final String? created_at;
  final String? updated_at;
  final MealCartEntity? meal;
  TypeEntity(
    this.id,
    this.name,
    this.available,
    this.price,
    this.supportprice,
    this.meal_id,
    this.created_at,
    this.updated_at,
    this.meal,
  );
  @override
  List<Object?> get props => [
    id,
    name,
    available,
    price,
    supportprice,
    meal_id,
    created_at,
    updated_at,
    meal,
  ];
}
class MealCartEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final int? maincategory_id;
  final String? created_at;
  final String? updated_at;

   MealCartEntity({
    this.id,
    this.name,
    this.image,
    this.description,
    this.maincategory_id,
    this.created_at,
    this.updated_at,
  });

  @override
  List<Object?> get props =>
      [id, name, image, description, maincategory_id, created_at, updated_at];
}