import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/confirm_delivery_entity.dart';
import '../../domain/usecases/confirm_delivery_usecase.dart';

part 'confirm_delivery_state.dart';

class ConfirmDeliveryCubit extends Cubit<ConfirmDeliveryState> {
  final ConfirmDeliveryUseCase usecase;
  ConfirmDeliveryCubit(this.usecase) : super(ConfirmDeliveryInitial());

  Future<void> confirmDelivery({
    required int cartId,
    required String note,
    required String address,
    String? couponId,
  }) async {
    emit(ConfirmDeliveryLoading());
    final result = await usecase.call(
      cartId: cartId,
      note: note,
      address: address,
      couponId: couponId,
    );

    result.fold(
          (failure) => emit(ConfirmDeliveryError(failure.message)),
          (entity) => emit(ConfirmDeliverySuccess(entity)),
    );
  }
}