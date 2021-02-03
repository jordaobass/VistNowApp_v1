import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/failures.dart';
import '../repository/application_repository.dart';
import '../repository/authentication_repository.dart';
import '../states/authentication_state.dart';

abstract class AuthenticationController {
  void creteAuthenticatedUserState(String tokenJWT);
  bool get userLoggedIn;
}

class AuthenticationControllerImpl extends GetxController
    implements AuthenticationController {
  final ApplicationRepository _applicationRepository;
  final AuthenticationRepository _authenticationRepository;

  AuthenticationControllerImpl({
    @required ApplicationRepository applicationRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _applicationRepository = applicationRepository,
        _authenticationRepository = authenticationRepository;

  final _authenticationState = Rx<AuthenticationState>(
    EmptyAuthenticationState(),
  );

  @override
  void onInit() async {
    super.onInit();
    var token = await _getToken();
    print(token); //TODO: remove this print
    _loginWithTokenJwt(token);
  }

  Future<String> _getToken() async {
    try {
      var token = await _applicationRepository.getTokenJWT();

      return token;
    } on LocalStorageFailure catch (_) {
      return '';
    }
  }

  @override
  Future<void> _loginWithTokenJwt(String token) async {}

  void creteAuthenticatedUserState(String tokenJWT) =>
      _authenticationState.value = SuccessAuthenticationState(
        tokenJWT,
      );

  @override
  bool get userLoggedIn =>
      _authenticationState.value is SuccessAuthenticationState;
}
