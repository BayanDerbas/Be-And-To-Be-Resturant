import 'package:dartz/dartz.dart';
import 'package:web_app/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/networks/failures.dart';
import '../entities/update_count_cart_entity.dart';

class MinusOneFromCartUseCase {
  final CartRepository repository;

  MinusOneFromCartUseCase(this.repository);

  Future<Either<Failure, UpdateCountCartEntity>> call(int itemId) async {
    return await repository.minusOne(itemId: itemId);
  }
}