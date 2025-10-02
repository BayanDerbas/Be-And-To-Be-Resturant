import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/domain/entities/login/login_user_entity.dart';
import 'package:web_app/features/auth/domain/repositories/login/login_repository.dart';

class LoginUseCase{
  final LoginRepository repository;

  LoginUseCase(this.repository);
  Future<Either<Failure,LoginUserEntity>> call ({
    required String phonenumber,
    required String password,
    required String device_token,   
}) async {
    return await repository.login(phonenumber: phonenumber, password: password,device_token:device_token);
  }
}