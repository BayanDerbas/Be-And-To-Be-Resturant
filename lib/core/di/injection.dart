import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:web_app/core/networks/dio_factory.dart';
import 'package:web_app/features/auth/data/data_sources/login/login_service.dart';
import 'package:web_app/features/auth/data/data_sources/logout/logout_service.dart';
import 'package:web_app/features/auth/data/data_sources/refresh/refresh_service.dart';
import 'package:web_app/features/auth/data/data_sources/register/register_service.dart';
import 'package:web_app/features/auth/data/repositories/login/login_repository_impl.dart';
import 'package:web_app/features/auth/data/repositories/refresh/refresh_respository_impl.dart';
import 'package:web_app/features/auth/data/repositories/register/register_repository_impl.dart';
import 'package:web_app/features/auth/domain/repositories/login/login_repository.dart';
import 'package:web_app/features/auth/domain/repositories/logout/logout_repository.dart';
import 'package:web_app/features/auth/domain/repositories/refresh/refresh_repository.dart';
import 'package:web_app/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/logout/logout_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/refresh/refresh_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/register/register_usecase.dart';
import 'package:web_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:web_app/features/branch/data/data_sources/branch_service.dart';
import 'package:web_app/features/branch/data/repositories/branches_repository_impl.dart';
import 'package:web_app/features/branch/domain/repositories/branches_repository.dart';
import 'package:web_app/features/branch/domain/usecases/branches_usecase.dart';
import '../../features/auth/data/repositories/logout/logout_repository_impl.dart';
import '../../features/auth/domain/repositories/register/register_repository.dart';
import '../../features/auth/presentation/cubit/refresh/refresh_cubit.dart';
import '../../features/branch/presentation/cubit/branch_cubit.dart';

final sl = GetIt.instance;

Future <void> init() async {
  sl.registerLazySingletonAsync<Dio>(() async => await DioFactory.getDio());

  // Data sources
  sl.registerLazySingletonAsync<RegisterService>(() async {
    final dio = await sl.getAsync<Dio>();
    return RegisterService(dio);
  });

  sl.registerLazySingletonAsync<LoginService>(() async {
    final dio = await sl.getAsync<Dio>();
    return LoginService(dio);
  });

  sl.registerLazySingletonAsync<LogoutService>(() async {
    final dio = await sl.getAsync<Dio>();
    return LogoutService(dio);
  });

  sl.registerLazySingletonAsync<RefreshService>(() async {
    final dio = await sl.getAsync<Dio>();
    return RefreshService(dio);
  });

  sl.registerLazySingletonAsync<BranchService>(() async {
    final dio = await sl.getAsync<Dio>();
    return BranchService(dio);
    });
  // Repositories
  sl.registerLazySingletonAsync<RegisterRepository>(() async {
    final service = await sl.getAsync<RegisterService>();
    return RegisterRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<LoginRepository>(() async {
    final service = await sl.getAsync<LoginService>();
    return LoginRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<LogoutRepository>(() async {
    final service = await sl.getAsync<LogoutService>();
    return LogoutRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<RefreshRepository>(() async {
    final service = await sl.getAsync<RefreshService>();
    return RefreshRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<BranchesRepository>(() async {
    final service = await sl.getAsync<BranchService>();
    return BranchesRepositoryImpl(service);
  });
  // Use cases
  sl.registerLazySingletonAsync<RegisterUseCase>(() async {
    final repo = await sl.getAsync<RegisterRepository>();
    return RegisterUseCase(repo);
  });

  sl.registerLazySingletonAsync<LoginUseCase>(() async {
    final repo = await sl.getAsync<LoginRepository>();
    return LoginUseCase(repo);
  });

  sl.registerLazySingletonAsync<LogoutUseCase>(() async {
    final repo = await sl.getAsync<LogoutRepository>();
    return LogoutUseCase(repo);
  });

  sl.registerLazySingletonAsync<RefreshUseCase>(() async {
    final repo = await sl.getAsync<RefreshRepository>();
    return RefreshUseCase(repo);
  });

  sl.registerLazySingletonAsync<BranchesUseCase>(() async {
    final repo = await sl.getAsync<BranchesRepository>();
    return BranchesUseCase(repo);
  });
  // Cubit
  sl.registerLazySingletonAsync<LoginCubit>(() async {
    final loginUseCase = await sl.getAsync<LoginUseCase>();
    return LoginCubit(loginUseCase);
  });

  sl.registerLazySingletonAsync<RegisterCubit>(() async {
    final registerUseCase = await sl.getAsync<RegisterUseCase>();
    return RegisterCubit(registerUseCase);
  });

  sl.registerLazySingletonAsync<LogoutCubit>(() async {
    final logoutUseCase = await sl.getAsync<LogoutUseCase>();
    return LogoutCubit(logoutUseCase);
  });

  sl.registerLazySingletonAsync<RefreshCubit>(() async {
    final refreshUseCase = await sl.getAsync<RefreshUseCase>();
    return RefreshCubit(refreshUseCase);
  });

  sl.registerLazySingletonAsync<BranchCubit>(() async {
    final branchesUseCase = await sl.getAsync<BranchesUseCase>();
    return BranchCubit(branchesUseCase);
  });
}
