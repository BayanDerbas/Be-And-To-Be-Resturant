import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/domain/entities/register_user.dart';
import 'package:web_app/features/auth/domain/repositories/register_repository.dart';

class RegisterUseCase{
  final RegisterRepository repository;

  RegisterUseCase(this.repository);
  Future<Either<Failure,RegisterUser>> call ({
    required String fullname,
    required String phonenumber,
    required String password
}) async {
    return await repository.register(fullname: fullname, phonenumber: phonenumber, password: password);
  }
}