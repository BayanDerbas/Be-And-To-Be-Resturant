import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/secure_storage.dart';
import '../../../domain/usecases/refresh/refresh_usecase.dart';

part 'refresh_state.dart';

class RefreshCubit extends Cubit<RefreshState> {
  final RefreshUseCase refreshUseCase;
  RefreshCubit(this.refreshUseCase) : super(RefreshInitial());

  Future<void> refreshToken() async {
    emit(RefreshLoading());

    final currentToken = await SecureStorage.getToken();
    if (currentToken == null) {
      emit(RefreshFailure("No token found"));
      return;
    }

    final result = await refreshUseCase("Bearer $currentToken");
    result.fold(
          (failure) => emit(RefreshFailure(failure.message)),
          (model) async {
        await SecureStorage.saveToken(model.access_token);
        print("✅ Token refreshed inside Cubit: ${model.access_token}");
        emit(RefreshSuccess(model.access_token ?? ""));
      },
    );
  }
}

// Future<void> refreshToken() async {
  //   emit(RefreshLoading());
  //   final refreshToken = await SecureStorage.getRefresh();
  //   if (refreshToken == null) {
  //     emit(RefreshFailure("No Refresh Token Found!!.."));
  //     return;
  //   }
  //   final result = await refreshUseCase("Bearer $refreshToken");
  //   result.fold((failure) => emit(RefreshFailure(failure.message)), (
  //     response,
  //   ) async {
  //     if (response.access_token != null) {
  //       await SecureStorage.saveToken(response.access_token!);
  //       emit(RefreshSuccess(response.access_token!));
  //     } else {
  //       emit(RefreshFailure("No new access token received"));
  //     }
  //   });
  // }
