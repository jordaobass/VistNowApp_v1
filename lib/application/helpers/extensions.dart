extension CustomStringExtension on String {
  String get cleanCpf => this.replaceAll(".", "").replaceAll("-", "").trim();
  String get cleanCnpj => this
      .replaceAll(".", "")
      .replaceAll("-", "")
      .replaceAll(RegExp(r'[\/]'), "")
      .trim();
  String get cleanPhone => this
      .replaceAll("(", "")
      .replaceAll(")", "")
      .replaceAll("-", "")
      .replaceAll(" ", "");

  bool get isNullOrBlank => this?.trim()?.isEmpty ?? true;

  String get capitalizeWords => this.toUpperCase();
}
