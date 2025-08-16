import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/features/auth/domain/entities/login/login_user_entity.dart';
import 'package:web_app/features/auth/domain/usecases/login/login_usecase.dart';

import '../../../../../core/utils/secure_storage.dart';
import '../auth_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({
    required String phonenumber,
    required String password,
  }) async {
    print('LoginCubit: Login started for $phonenumber');

    emit(LoginLoading());

    final result = await loginUseCase(
      phonenumber: phonenumber,
      password: password,
    );

    result.fold(
          (failure) {
        print('LoginCubit: Login failed: ${failure.message}');
        emit(LoginFailure(failure.message));
      },
          (response) async {
        print('LoginCubit: Login success: ${response.toJson()}');
        await SecureStorage.saveToken(response.access_token);
        await SecureStorage.saveUserData(response.toJson());
        emit(LoginSuccess(response));
          },
    );
  }

}
