import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/coupon_entity.dart';
import '../../domain/usecases/coupons_usecase.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final CouponsUseCase couponsUseCase;

  CouponCubit(this.couponsUseCase) : super(CouponInitial());
  Future<void> getCoupons(int branchId) async {
    emit(CouponLoading());
    final result = await couponsUseCase(branchId);
    result.fold(
          (failure) => emit(CouponError(failure.message)),
          (coupons) => emit(CouponLoaded(coupons)),
    );
  }
}