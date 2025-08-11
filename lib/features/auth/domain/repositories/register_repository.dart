import 'package:dartz/dartz.dart';
import 'package:web_app/features/auth/domain/entities/register_user.dart';
import '../../../../core/networks/failures.dart';

abstract class RegisterRepository{
  Future<Either<Failure,RegisterUser>> register({
    required String fullname,
    required String phonenumber,
    required String password,
});
}