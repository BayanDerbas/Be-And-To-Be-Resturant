import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _secureStorage = const FlutterSecureStorage();
  static final Map<String, String> _webStorage = {};

  static const _keyToken = 'access_token';
  static const _keyUserData = 'user_data';

  static Future<void> saveToken(String? token) async {
    if (token == null) return;
    if (kIsWeb) {
      _webStorage[_keyToken] = token;
    } else {
      await _secureStorage.write(key: _keyToken, value: token);
    }
    print("💾 Saved new Access Token: $token");
  }

  static Future<String?> getToken() async {
    return kIsWeb ? _webStorage[_keyToken] : await _secureStorage.read(key: _keyToken);
  }

  static Future<void> deleteToken() async {
    if (kIsWeb) {
      _webStorage.remove(_keyToken);
    } else {
      await _secureStorage.delete(key: _keyToken);
    }
    print("🗑️ Deleted Access Token");
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final jsonString = jsonEncode(userData);
    if (kIsWeb) {
      _webStorage[_keyUserData] = jsonString;
    } else {
      await _secureStorage.write(key: _keyUserData, value: jsonString);
    }
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    String? jsonString;
    if (kIsWeb) {
      jsonString = _webStorage[_keyUserData];
    } else {
      jsonString = await _secureStorage.read(key: _keyUserData);
    }
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  static Future<void> deleteUserData() async {
    if (kIsWeb) {
      _webStorage.remove(_keyUserData);
    } else {
      await _secureStorage.delete(key: _keyUserData);
    }
  }
}