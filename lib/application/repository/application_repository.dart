import 'package:meta/meta.dart';

import '../models/failures.dart';
import '../adapters/safe_local_storage.dart';

abstract class ApplicationRepository {
  Future<String> getTokenJWT();
  Future<void> writeTokenJWT(String token);
}

class ApplicationRepositoryImpl implements ApplicationRepository {
  final SafeLocalStoragePermissionAdapter _localStorage;

  ApplicationRepositoryImpl({
    @required SafeLocalStoragePermissionAdapter localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<String> getTokenJWT() async {
    try {
      var token = await _localStorage.readTokenJWT();

      return token;
    } on LocalStorageFailure catch (error) {
      throw LocalStorageFailure(message: error.message);
    }
  }

  @override
  Future<void> writeTokenJWT(String token) async {
    try {
      await _localStorage.writeTokenJWT(token);
    } on LocalStorageFailure catch (error) {
      throw LocalStorageFailure(message: error.message);
    }
  }
}

class ApplicationRepositoryMock implements ApplicationRepository {
  @override
  Future<String> getTokenJWT() async {
    return 'some token';
  }

  @override
  Future<void> writeTokenJWT(String token) async {
    return;
  }
}
