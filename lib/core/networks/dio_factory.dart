import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../features/auth/data/repositories/refresh/refresh_respository_impl.dart';
import '../utils/secure_storage.dart';
import 'api_constant.dart';

class DioFactory {
  static Future<Dio> getDio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: false,
        maxWidth: 120,
      ),
    );

    return dio;
  }

  static Dio createDioWithRefresh(RefreshRepositoryImpl refreshRepo) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: false,
        maxWidth: 120,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            try {
              final currentToken = await SecureStorage.getToken();
              if (currentToken == null) return handler.next(e);

              print("🔄 Attempting token refresh for request: ${e.requestOptions.path}");

              final result = await refreshRepo.refresh("Bearer $currentToken");

              return await result.fold(
                    (failure) {
                  print("❌ Failed to refresh token: ${failure.message}");
                  return handler.next(e);
                },
                    (model) async {
                  await SecureStorage.saveToken(model.access_token);
                  print("✅ Token refreshed: ${model.access_token}");

                  e.requestOptions.headers['Authorization'] =
                  'Bearer ${model.access_token}';
                  final retryResponse = await dio.fetch(e.requestOptions);
                  return handler.resolve(retryResponse);
                },
              );
            } catch (err) {
              print("❌ Exception during token refresh: $err");
              return handler.next(e);
            }
          }
          return handler.next(e);
        },
      ),
    );
    return dio;
  }
}
