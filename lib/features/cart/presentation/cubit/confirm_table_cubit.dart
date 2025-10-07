import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/confirm_table_entity.dart';
import '../../domain/usecases/confirm _table_usecase.dart';

part 'confirm_table_state.dart';

class ConfirmTableOrderCubit extends Cubit<ConfirmTableOrderState> {
  final ConfirmTableOrderUseCase useCase;

  ConfirmTableOrderCubit(this.useCase) : super(ConfirmTableOrderInitial());

  Future<void> confirmTableOrder({
    required int cartId,
    required String tableNumber,
    required String note,
    String? couponId,
  }) async {
    emit(ConfirmTableOrderLoading());
    final result = await useCase(
      cartId: cartId,
      tableNumber: tableNumber,
      note: note,
      couponId: couponId,
    );
    result.fold(
          (failure) => emit(ConfirmTableOrderError(failure.message)),
          (entity) => emit(ConfirmTableOrderSuccess(entity)),
    );
  }
}
