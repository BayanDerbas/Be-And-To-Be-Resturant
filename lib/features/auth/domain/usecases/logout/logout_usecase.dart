import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/domain/entities/logout/logout_entity.dart';
import 'package:web_app/features/auth/domain/repositories/logout/logout_repository.dart';

class LogoutUseCase {
  final LogoutRepository repository;

  LogoutUseCase(this.repository);
   Future<Either<Failure,LogoutEntity>> call (String bearerToken) async {
     return await repository.logout(bearerToken);
   }
}