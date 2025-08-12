import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/data/data_sources/login/login_service.dart';
import 'package:web_app/features/auth/domain/entities/login/login_user_entity.dart';
import 'package:web_app/features/auth/domain/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService service;

  LoginRepositoryImpl(this.service);
  @override
  Future<Either<Failure, LoginUserEntity>> login({
    required String phonenumber,
    required String password,
  }) async {
    try {
      final result = await service.login(
        password: password,
        phonenumber: phonenumber,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioError(e));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }
}
