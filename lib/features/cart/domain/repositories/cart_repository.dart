import 'package:dartz/dartz.dart';
import '../../../../core/networks/failures.dart';
import '../entities/add_to_cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, AddToCartResponseEntity>> addToCart({
    required int type_id,
    required int amount,
    required int price,
    required int extra,
    required int branch_id,
  });
}


