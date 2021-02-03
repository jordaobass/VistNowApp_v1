abstract class AuthenticationState {}

class SuccessAuthenticationState implements AuthenticationState {
  final String tokenJWT;

  SuccessAuthenticationState(this.tokenJWT);
}

class EmptyAuthenticationState implements AuthenticationState {}
