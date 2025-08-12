import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static final _secureStorage = FlutterSecureStorage();
  static SharedPreferences? _prefs;

  static const _keyToken = 'access_token';
  static const _keyUserData = 'user_data';

  static Future<void> init() async {
    if (kIsWeb) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  static Future<void> saveToken(String? token) async {
    if (token == null) return;
    if (kIsWeb) {
      if (_prefs == null) _prefs = await SharedPreferences.getInstance();
      await _prefs!.setString(_keyToken, token);
    } else {
      await _secureStorage.write(key: _keyToken, value: token);
    }
  }


  static Future<String?> getToken() async {
    if (kIsWeb) {
      return _prefs!.getString(_keyToken);
    } else {
      return await _secureStorage.read(key: _keyToken);
    }
  }

  static Future<void> deleteToken() async {
    if (kIsWeb) {
      await _prefs!.remove(_keyToken);
    } else {
      await _secureStorage.delete(key: _keyToken);
    }
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final jsonString = jsonEncode(userData);
    if (kIsWeb) {
      await _prefs!.setString(_keyUserData, jsonString);
    } else {
      await _secureStorage.write(key: _keyUserData, value: jsonString);
    }
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    String? jsonString;
    if (kIsWeb) {
      jsonString = _prefs!.getString(_keyUserData);
    } else {
      jsonString = await _secureStorage.read(key: _keyUserData);
    }
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  static Future<void> deleteUserData() async {
    if (kIsWeb) {
      await _prefs!.remove(_keyUserData);
    } else {
      await _secureStorage.delete(key: _keyUserData);
    }
  }
}
