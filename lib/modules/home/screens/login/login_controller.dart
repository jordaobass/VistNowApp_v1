import 'package:get/get.dart';

import '../../../../application/helpers/validators.dart';
import '../../../../application/states/text_form_field_state.dart';
import '../../../../application/values/routes.dart';

abstract class LoginController {
  TextFormFieldState get emailState;
  TextFormFieldState get passwordState;
  bool get isFormValid;
  bool get isLoading;

  void onChangedEmailState(String newValue);
  void onChangedPasswordState(String newValue);
  Future<void> login();
  void popCurrentPage();
  void navigateToCreateAccount();
}

class LoginControllerImpl extends GetxController implements LoginController {
  final _emailState = Rx<TextFormFieldState>(
    TextFormFieldState(
      currentValue: '',
      validator: Validators.requiredField,
    ),
  );

  final _passwordState = Rx<TextFormFieldState>(
    TextFormFieldState(
      currentValue: '',
      validator: Validators.requiredField,
    ),
  );

  final _loginState = Rx<bool>(false);

  @override
  TextFormFieldState get emailState => _emailState.value;

  @override
  TextFormFieldState get passwordState => _passwordState.value;

  @override
  bool get isFormValid =>
      _emailState.value.isFormValid && _passwordState.value.isFormValid;

  @override
  bool get isLoading => _loginState.value;

  @override
  void onChangedEmailState(String newValue) {
    _emailState.value = TextFormFieldState(
      currentValue: newValue,
      validator: Validators.requiredField,
    );
  }

  @override
  void onChangedPasswordState(String newValue) {
    _passwordState.value = TextFormFieldState(
      currentValue: newValue,
      validator: Validators.requiredField,
    );
  }

  @override
  Future<void> login() async {
    _loginState.value = true;
    await Future.delayed(Duration(seconds: 2));
    _loginState.value = false;
    Get.back();
  }

  @override
  void popCurrentPage() {
    Get.back();
  }

  @override
  void navigateToCreateAccount() {
    Get.toNamed(Routes.createAccount);
  }
}
