import 'package:dartz/dartz.dart';
import 'package:web_app/features/cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:web_app/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/networks/failures.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<Either<Failure, AddToCartResponseEntity>> call({
    required int typeId,
    required int amount,
    required int price,
    required int extra,
    required int branchId,
  }) {
    return repository.addToCart(
      type_id: typeId,
      amount: amount,
      price: price,
      extra: extra,
      branch_id: branchId,
    );
  }
}
