import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/features/auth/domain/entities/login/login_user_entity.dart';
import 'package:web_app/features/auth/domain/usecases/login/login_usecase.dart';

import '../../../../../core/utils/secure_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({
    required String phonenumber,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await loginUseCase(
      phonenumber: phonenumber,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (response) async {
        await SecureStorage.saveToken(response.access_token);
        await SecureStorage.saveUserData(response.toJson());
        return emit(LoginSuccess(response));
        },
    );
  }
}
