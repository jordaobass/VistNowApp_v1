import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationRepository {}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Dio _dio;

  AuthenticationRepositoryImpl({@required Dio http}) : _dio = http;
}

class AuthenticationRepositoryMock implements AuthenticationRepository {}
