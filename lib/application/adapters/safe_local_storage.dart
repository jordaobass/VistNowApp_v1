import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/failures.dart';
import '../values/strings.dart';

abstract class SafeLocalStoragePermissionAdapter {
  Future<void> writeTokenJWT(String token);
  Future<String> readTokenJWT();
}

class FlutterSecureLocalStorage implements SafeLocalStoragePermissionAdapter {
  final _storage = FlutterSecureStorage();

  final String _tokenJwtKey = 'tokenJWT';

  @override
  Future<String> readTokenJWT() async {
    try {
      var token = await _storage.read(key: _tokenJwtKey);

      return token ?? '';
    } on Exception catch (_) {
      throw LocalStorageFailure(message: Strings.readCacheError);
    }
  }

  @override
  Future<void> writeTokenJWT(String token) async {
    try {
      await _storage.write(key: _tokenJwtKey, value: token);
    } on Exception catch (_) {
      throw LocalStorageFailure(message: Strings.writeCacheError);
    }
  }
}
