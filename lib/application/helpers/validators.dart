import 'package:cpfcnpj/cpfcnpj.dart';
import '../../application/values/strings.dart';

import 'extensions.dart';

abstract class Validators {
  static String validateCPFOrCNPJ(String document) {
    if (document.isNullOrBlank) {
      return Strings.errorCPFOrCNPJEmpty;
    } else {
      return (CPF.isValid(document) || CNPJ.isValid(document))
          ? null
          : (document.length > 14)
              ? Strings.errorCNPJInvalid
              : Strings.errorCPFInvalid;
    }
  }

  static String validateCPF(String cpf) {
    if (cpf.isNullOrBlank) {
      return Strings.requiredField;
    } else {
      return (CPF.isValid(cpf)) ? null : Strings.errorCPFInvalid;
    }
  }

  static String validateCNPJ(String cpf) {
    if (cpf.isNullOrBlank) {
      return Strings.requiredField;
    } else {
      return (CNPJ.isValid(cpf)) ? null : Strings.errorCNPJInvalid;
    }
  }

  static String requiredField(String value) {
    if (value.isNullOrBlank) {
      return Strings.requiredField;
    }

    return null;
  }
}
