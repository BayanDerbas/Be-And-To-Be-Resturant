import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  SecureStorage._();

  static final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  static const String _keyToken = 'access_token';
  static const String _keyUserData = 'user_data';

  static Future <void> saveToken (String token) async {
    await secureStorage.write(key: _keyToken, value: token);
  }
  static Future <String?> getToken () async {
    return await secureStorage.read(key: _keyToken);
  }
  static Future <void> deleteToken () async {
    await secureStorage.delete(key: _keyToken);
  }
  // static Future <void> saveDataClient (String fullname ,String password , String phonenumebr String role) async {
  //   await secureStorage.write(key: _keyUserData, value: value)
  // }
}