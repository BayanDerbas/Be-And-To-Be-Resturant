import 'package:bloc/bloc.dart';
import 'package:web_app/features/auth/domain/usecases/logout/logout_usecase.dart';

import '../../../../../core/utils/secure_storage.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutUseCase logoutUseCase;
  LogoutCubit(this.logoutUseCase) : super(LogoutInitial());

  Future <void> logout() async {
    emit(LogoutLoading());
    final token = await SecureStorage.getToken();
    if(token == null){
      emit(LogoutFailure());
      return;
    }
    final result = await logoutUseCase("Bearer $token");
    result.fold(
            (failure) async {
              emit(LogoutFailure());
            },
            (response) async {
              await SecureStorage.deleteToken();
              emit(LogoutSuccess());
            },
    );
  }
}
