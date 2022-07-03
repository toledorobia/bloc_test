import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  Future<void> write(String key, String value) {
    return _secureStorage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
  }

  Future<String?> read(String key) async {
    bool exists = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());

    if (!exists) {
      return null;
    }

    return _secureStorage.read(key: key, aOptions: _getAndroidOptions());
  }

  Future<void> delete(String key) async {
    bool exists = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());

    if (!exists) {
      return;
    }

    return _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
  }
}
