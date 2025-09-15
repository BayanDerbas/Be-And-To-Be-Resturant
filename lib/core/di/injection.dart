import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:web_app/core/networks/dio_factory.dart';
import 'package:web_app/features/auth/data/data_sources/login/login_service.dart';
import 'package:web_app/features/auth/data/data_sources/logout/logout_service.dart';
import 'package:web_app/features/auth/data/data_sources/refresh/refresh_service.dart';
import 'package:web_app/features/auth/data/data_sources/register/register_service.dart';
import 'package:web_app/features/auth/data/repositories/login/login_repository_impl.dart';
import 'package:web_app/features/auth/data/repositories/logout/logout_repository_impl.dart';
import 'package:web_app/features/auth/data/repositories/refresh/refresh_respository_impl.dart';
import 'package:web_app/features/auth/data/repositories/register/register_repository_impl.dart';
import 'package:web_app/features/auth/domain/repositories/login/login_repository.dart';
import 'package:web_app/features/auth/domain/repositories/logout/logout_repository.dart';
import 'package:web_app/features/auth/domain/repositories/refresh/refresh_repository.dart';
import 'package:web_app/features/auth/domain/repositories/register/register_repository.dart';
import 'package:web_app/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/logout/logout_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/refresh/refresh_usecase.dart';
import 'package:web_app/features/auth/domain/usecases/register/register_usecase.dart';
import 'package:web_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:web_app/features/auth/presentation/cubit/refresh/refresh_cubit.dart';
import 'package:web_app/features/branch/data/data_sources/branch_service.dart';
import 'package:web_app/features/branch/data/repositories/branches_repository_impl.dart';
import 'package:web_app/features/branch/domain/repositories/branches_repository.dart';
import 'package:web_app/features/branch/domain/usecases/branches_usecase.dart';
import 'package:web_app/features/branch/presentation/cubit/branch_cubit.dart';
import 'package:web_app/features/home/data/data_services/categories_service.dart';
import 'package:web_app/features/home/data/repositories/main_category_repository_impl.dart';
import 'package:web_app/features/home/domain/repositories/main_category_repository.dart';

import '../../features/home/domain/usecases/get_main_categories_usecase.dart';
import '../../features/home/presentation/cubit/products/products_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ============================
  // Refresh repo
  // ============================
  sl.registerLazySingletonAsync<RefreshService>(() async {
    final dio = await DioFactory.getDio();
    return RefreshService(dio);
  });

  sl.registerLazySingletonAsync<RefreshRepository>(() async {
    final service = await sl.getAsync<RefreshService>();
    return RefreshRepositoryImpl(service);
  });

  // ============================
  // Dio with Refresh
  // ============================
  sl.registerLazySingletonAsync<Dio>(() async {
    final refreshRepo = await sl.getAsync<RefreshRepository>();
    return DioFactory.createDioWithRefresh(refreshRepo as RefreshRepositoryImpl);
  });

  // ============================
  // Data Sources
  // ============================
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

  sl.registerLazySingletonAsync<BranchService>(() async {
    final dio = await sl.getAsync<Dio>();
    return BranchService(dio);
  });

  sl.registerLazySingletonAsync<CategoriesService>(() async {
    final dio = await sl.getAsync<Dio>();
    return CategoriesService(dio);
  });

  // ============================
  // Repositories
  // ============================
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

  sl.registerLazySingletonAsync<BranchesRepository>(() async {
    final service = await sl.getAsync<BranchService>();
    return BranchesRepositoryImpl(service);
  });

  sl.registerLazySingletonAsync<MainCategoryRepository>(() async {
    final service = await sl.getAsync<CategoriesService>();
    return MainCategoriesRepositoryImpl(service);
  });


  // ============================
  // Use Cases
  // ============================
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

  sl.registerLazySingletonAsync<GetMainCategoriesUseCase>(() async {
    final repo = await sl.getAsync<MainCategoryRepository>();
    return GetMainCategoriesUseCase(repo);
  });

  // ============================
  // Cubits
  // ============================
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<LoginUseCase>()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl<RegisterUseCase>()));
  sl.registerFactory<LogoutCubit>(() => LogoutCubit(sl<LogoutUseCase>()));
  sl.registerFactory<RefreshCubit>(() => RefreshCubit(sl<RefreshUseCase>()));
  sl.registerFactory<BranchCubit>(() => BranchCubit(sl<BranchesUseCase>()));
  sl.registerFactory<ProductsCubit>(() => ProductsCubit(sl<GetMainCategoriesUseCase>()));
}
