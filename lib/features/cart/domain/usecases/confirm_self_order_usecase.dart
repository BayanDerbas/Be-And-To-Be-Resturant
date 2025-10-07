import 'package:dartz/dartz.dart';

import '../../../../core/networks/failures.dart';
import '../entities/confirm_self_order_entity.dart';
import '../repositories/cart_repository.dart';

class ConfirmSelfOrderUseCase {
  final CartRepository repository;
  ConfirmSelfOrderUseCase(this.repository);

  Future<Either<Failure, ConfirmSelfOrderEntity>> call({
    String? couponId,
    required int cartId,
    required String note,
  }) {
    return repository.confirmSelfOrder(cartId: cartId, note: note, couponId: couponId);
  }
}