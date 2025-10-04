import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/update_count_cart_entity.dart';
import '../../domain/usecases/add_one_to_cart_usecase.dart';
import '../../domain/usecases/minus_one_to_cart_usecase.dart';

part 'update_count_cart_state.dart';

class UpdateCountCartCubit extends Cubit<UpdateCountCartState> {
  final AddOneToCartUseCase addOneUseCase;
  final MinusOneFromCartUseCase minusOneUseCase;

  UpdateCountCartCubit({required this.addOneUseCase, required this.minusOneUseCase})
      : super(UpdateCountCartInitial());

  Future<void> addOne(int itemId) async {
    emit(UpdateCountCartLoading());
    final result = await addOneUseCase.call(itemId);
    result.fold(
          (failure) => emit(UpdateCountCartError(failure.message)),
          (entity) => emit(UpdateCountCartSuccess(entity)),
    );
  }

  Future<void> minusOne(int itemId) async {
    emit(UpdateCountCartLoading());
    final result = await minusOneUseCase.call(itemId);
    result.fold(
          (failure) => emit(UpdateCountCartError(failure.message)),
          (entity) => emit(UpdateCountCartSuccess(entity)),
    );
  }
}
