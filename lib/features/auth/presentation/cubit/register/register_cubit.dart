import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/features/auth/domain/entities/register/register_user.dart';
import 'package:web_app/features/auth/domain/usecases/register/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register({
    required String fullname,
    required String phonenumber,
    required String password,
}) async {
    emit(RegisterLoading());
    final result = await registerUseCase(
      fullname: fullname,
      phonenumber: phonenumber,
      password: password
    );
    result.fold(
            (failure) => emit(RegisterFailure(failure.message)),
            (response) => emit(RegisterSuccess(response)),
    );
  }
}
