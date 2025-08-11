import 'package:dio/dio.dart';
import 'package:web_app/core/utils/secure_storage.dart';

class DioFactory{
  DioFactory._();
  static Dio? dio;

  static Future<Dio> getDio() async {
    if(dio == null){
      dio = Dio();
      dio!
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10);
      dio!.options.headers = {'Accept' : 'application:json'};

      final token = await SecureStorage.getToken();
      if (token != null) {
        dio!.options.headers['Authorization'] = 'Bearer $token';
      }
      dio!.interceptors.add(LogInterceptor(requestBody: true ,responseBody: true));
    }
    return dio!;
  }
  static Future <void> setToken(String token) async {
    await SecureStorage.saveToken(token);
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }
  static Future <void> clearToken(String token) async {
    await SecureStorage.deleteToken();
    dio?.options.headers.remove('Authorization');
  }
}