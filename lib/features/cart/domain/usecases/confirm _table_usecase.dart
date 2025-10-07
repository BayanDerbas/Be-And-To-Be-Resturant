import 'package:dartz/dartz.dart';
import 'package:web_app/features/cart/domain/entities/confirm_table_entity.dart';
import '../../../../core/networks/failures.dart';
import '../repositories/cart_repository.dart';

class ConfirmTableOrderUseCase {
  final CartRepository repository;

  ConfirmTableOrderUseCase(this.repository);

  Future<Either<Failure, ConfirmTableOrderEntity>> call({
    required int cartId,
    required String tableNumber,
    required String note,
    String? couponId,
  }) async {
    return repository.confirmTableOrder(cartId: cartId, tableNumber: tableNumber, note: note ,couponId: couponId);
  }
}
