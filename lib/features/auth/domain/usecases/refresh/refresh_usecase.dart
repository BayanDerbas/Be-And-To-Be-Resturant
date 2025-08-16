import 'package:dartz/dartz.dart';
import 'package:web_app/core/networks/failures.dart';
import 'package:web_app/features/auth/domain/entities/refresh/refresh_entity.dart';
import 'package:web_app/features/auth/domain/repositories/refresh/refresh_repository.dart';

class RefreshUseCase{
  final RefreshRepository repository;

  RefreshUseCase(this.repository);
  Future <Either<Failure,RefreshEntity>> call(String bearerToken) async {
    return await repository.refresh(bearerToken);
  }
}