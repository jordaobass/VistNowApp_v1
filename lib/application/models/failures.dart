abstract class Failures implements Exception {
  final String message;

  Failures({this.message});

  @override
  String toString() {
    return message;
  }
}

class LocalStorageFailure extends Failures {
  final String message;

  LocalStorageFailure({this.message}) : super(message: message);
}

class LocalizationFailure extends Failures {
  final String message;

  LocalizationFailure({this.message}) : super(message: message);
}
