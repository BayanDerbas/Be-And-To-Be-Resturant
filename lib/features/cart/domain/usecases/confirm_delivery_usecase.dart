import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/cart/domain/entities/confirm_delivery_entity.dart';
import 'package:web_app/features/cart/domain/repositories/cart_repository.dart';

class ConfirmDeliveryUseCase{
  final CartRepository repository;

  ConfirmDeliveryUseCase(this.repository);

  Future<Either<Failure,ConfirmDeliveryEntity>> call({
    required int cartId,
    required String note,
    required String address,
    String? couponId,
}) async {
    return repository.confirmDeliveryOrder(cartId: cartId, note: note, address: address);
}
}