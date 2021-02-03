import 'package:meta/meta.dart';

class TextFormFieldState {
  final String currentValue;
  final String Function(String value) validator;

  TextFormFieldState({
    @required this.currentValue,
    @required this.validator,
  });

  bool get isFormValid => validator(currentValue) == null;
}
