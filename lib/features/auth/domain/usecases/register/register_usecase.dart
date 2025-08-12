import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/domain/entities/register/register_user.dart';
import 'package:web_app/features/auth/domain/repositories/register/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);
  Future<Either<Failure, RegisterUserEntity>> call({
    required String fullname,
    required String phonenumber,
    required String password,
  }) async {
    return await repository.register(
      fullname: fullname,
      phonenumber: phonenumber,
      password: password,
    );
  }
}
