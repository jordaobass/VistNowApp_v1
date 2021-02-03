import 'dart:io';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../application/adapters/image_picker.dart';
import '../../../../application/helpers/validators.dart';
import '../../../../application/states/text_form_field_state.dart';
import '../../../../application/values/routes.dart';
import '../../../../application/values/strings.dart';
import '../../../feedback/models/feedback_arguments.dart';

enum ControllerFormState {
  completeName,
  email,
  password,
  passwordConfirmation,
  phone
}

abstract class CreateAccountController {
  TextFormFieldState get completeNameForm;
  TextFormFieldState get emailForm;
  TextFormFieldState get phoneNumberForm;
  TextFormFieldState get passwordForm;
  TextFormFieldState get passwordConfirmationForm;
  bool get isFormValid;
  bool get isLoading;
  File get imageFile;

  void popCurrentPage();
  void onChangedForm(String newValue, ControllerFormState formType);
  Future<void> registerUser();
  Future<void> getImageFromGalery();
}

class CreateAccountControllerImpl extends GetxController
    implements CreateAccountController {
  final ImagePickerAdapter _imagePickerAdapter;

  CreateAccountControllerImpl({
    @required ImagePickerAdapter imagePickerAdapter,
  }) : _imagePickerAdapter = imagePickerAdapter;

  @override
  void popCurrentPage() {
    Get.back();
  }

  final _completeNameState = Rx<TextFormFieldState>(TextFormFieldState(
    currentValue: '',
    validator: Validators.requiredField,
  ));

  final _emailState = Rx<TextFormFieldState>(TextFormFieldState(
    currentValue: '',
    validator: Validators.requiredField,
  ));

  final _phoneNumberState = Rx<TextFormFieldState>(TextFormFieldState(
    currentValue: '',
    validator: Validators.requiredField,
  ));

  final _passwordState = Rx<TextFormFieldState>(TextFormFieldState(
    currentValue: '',
    validator: Validators.requiredField,
  ));

  final _passwordConfirmationState = Rx<TextFormFieldState>(TextFormFieldState(
    currentValue: '',
    validator: Validators.requiredField,
  ));

  @override
  TextFormFieldState get completeNameForm => _completeNameState.value;

  @override
  TextFormFieldState get emailForm => _emailState.value;

  @override
  TextFormFieldState get phoneNumberForm => _phoneNumberState.value;

  @override
  TextFormFieldState get passwordForm => _passwordState.value;

  @override
  TextFormFieldState get passwordConfirmationForm =>
      _passwordConfirmationState.value;

  @override
  void onChangedForm(String newValue, ControllerFormState formType) {
    switch (formType) {
      case ControllerFormState.completeName:
        {
          _completeNameState.value = TextFormFieldState(
            currentValue: newValue,
            validator: Validators.requiredField,
          );
        }
        break;
      case ControllerFormState.email:
        {
          _emailState.value = TextFormFieldState(
            currentValue: newValue,
            validator: Validators.requiredField,
          );
        }
        break;
      case ControllerFormState.phone:
        {
          _phoneNumberState.value = TextFormFieldState(
            currentValue: newValue,
            validator: Validators.requiredField,
          );
        }
        break;
      case ControllerFormState.password:
        {
          _passwordState.value = TextFormFieldState(
            currentValue: newValue,
            validator: Validators.requiredField,
          );
        }
        break;
      case ControllerFormState.passwordConfirmation:
        {
          _passwordConfirmationState.value = TextFormFieldState(
            currentValue: newValue,
            validator: Validators.requiredField,
          );
        }
        break;
      default:
        break;
    }
  }

  @override
  bool get isFormValid =>
      _completeNameState.value.isFormValid &&
      _emailState.value.isFormValid &&
      _passwordState.value.isFormValid &&
      _passwordConfirmationState.value.isFormValid;

  final _loadingState = Rx<bool>(false);

  @override
  bool get isLoading => _loadingState.value;

  @override
  Future<void> registerUser() async {
    _loadingState.value = true;

    await Future.delayed(
      Duration(seconds: 2),
    ); //TODO: implements the repository of login

    _loadingState.value = false;

    Get.toNamed(
      Routes.feedback,
      arguments: FeedbackArguments(
        isSuccess: false,
        title: Strings.createAccountSuccessLabel,
        subtitle: Strings.createAccountSuccessLabelDescription,
      ),
    );
  }

  final _imageFile = Rx<File>();

  @override
  File get imageFile => _imageFile.value;

  @override
  Future<void> getImageFromGalery() async {
    var picture = await _imagePickerAdapter.getImageFromGalery();

    if (picture.path.isBlank || picture.path == null) {
      return;
    }
    _imageFile.value = picture;
  }
}
