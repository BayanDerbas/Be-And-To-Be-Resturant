import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cart_info_entity.dart';

part 'cart_info_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  @JsonKey(name: 'cart info')
  final List<CartInfoModel>? cartInfo;

  CartResponseModel({this.cartInfo});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartInfoModel extends CartInfoEntity {
  @JsonKey(name: "cartitems")
  final List<CartItemModel>? cartitems;

  CartInfoModel(
      int? id,
      int? user_id,
      int? item_number,
      int? total_price,
      String? created_at,
      String? updated_at,
      int? branch_id,
      this.cartitems,
      ) : super(
    id,
    user_id,
    item_number,
    total_price,
    created_at,
    updated_at,
    branch_id,
    cartitems,
  );

  factory CartInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CartInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartInfoModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartItemModel extends CartItemEntity {
  @override
  final TypeModel? type;

  CartItemModel(
      int? id,
      int? type_id,
      int? cart_id,
      int? extra,
      int? amount,
      String? created_at,
      String? updated_at,
      this.type,
      ) : super(
    id,
    type_id,
    cart_id,
    extra,
    amount,
    created_at,
    updated_at,
    type,
  );

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TypeModel extends TypeEntity {
  @override
  final MealCartModel? meal;

  TypeModel(
      int? id,
      String? name,
      int? available,
      int? price,
      int? supportprice,
      int? meal_id,
      String? created_at,
      String? updated_at,
      this.meal,
      ) : super(
    id,
    name,
    available,
    price,
    supportprice,
    meal_id,
    created_at,
    updated_at,
    meal,
  );

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}

@JsonSerializable()
class MealCartModel extends MealCartEntity {
  MealCartModel({
    int? id,
    String? name,
    String? image,
    String? description,
    int? maincategory_id,
    String? created_at,
    String? updated_at,
  }) : super(
    id: id,
    name: name,
    image: image,
    description: description,
    maincategory_id: maincategory_id,
    created_at: created_at,
    updated_at: updated_at,
  );

  factory MealCartModel.fromJson(Map<String, dynamic> json) =>
      _$MealCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealCartModelToJson(this);
}
