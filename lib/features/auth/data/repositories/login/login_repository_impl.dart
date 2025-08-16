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
    print('LoginRepositoryImpl: Calling login API with $phonenumber / $password');

    try {
      final result = await service.login(
        password: password,
        phonenumber: phonenumber,
      );
      print('LoginRepositoryImpl: API response: ${result.toJson()}');
      return Right(result);
    } on DioException catch (e) {
      print('LoginRepositoryImpl: DioException: ${e.message}');
      return Left(Failure.fromDioError(e));
    } catch (e) {
      print('LoginRepositoryImpl: Unexpected error: $e');
      return Left(Failure('Unexpected error: $e'));
    }
  }
}
