import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/confirm_self_order_entity.dart';
import '../../domain/usecases/confirm_self_order_usecase.dart';
import '../../../../core/networks/failures.dart';
import 'package:dartz/dartz.dart';

part 'confirm_self_order_state.dart';

class ConfirmSelfOrderCubit extends Cubit<ConfirmSelfOrderState> {
  final ConfirmSelfOrderUseCase useCase;
  ConfirmSelfOrderCubit(this.useCase) : super(ConfirmSelfOrderInitial());

  Future<void> confirmSelfOrder({
    required int cartId,
    required String note,
    String? couponId,
  }) async {
    emit(ConfirmSelfOrderLoading());
    final Either<Failure, ConfirmSelfOrderEntity> result =
    await useCase.call(cartId: cartId, note: note, couponId: couponId);
    result.fold(
          (failure) => emit(ConfirmSelfOrderError(failure.message ?? 'Unknown error')),
          (entity) => emit(ConfirmSelfOrderLoaded(entity)),
    );
  }
}
