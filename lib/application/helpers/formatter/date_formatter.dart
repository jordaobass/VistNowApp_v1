import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../extensions.dart';

class DateFormatter {
  static DateFormat _dateFormat({@required format}) {
    return DateFormat(format);
  }

  /// Return a date formatted dd/MM/yyyy
  static String fullDate(DateTime date) =>
      _dateFormat(format: "dd/MM/yyyy").format(date);

  /// Return a date formatted dd MMM yyyy. eg: 14 Dec 2020 (in US Locale), 14 Dez 2020 (in pt_BR Locale)
  static String dayMonthNameYear(DateTime date) =>
      _dateFormat(format: "dd MMM yyyy").format(date).capitalizeWords;

  /// Return only the hour and minute of a DateTime. eg: 11:45
  static String hourMinute(DateTime date) =>
      _dateFormat(format: "HH:mm").format(date);

  /// Return a date formatted dd MMM eg: 14 DEC (in US Locale), 14 DEZ (in pt_BR Locale)
  static String dayMonthName(DateTime date) =>
      _dateFormat(format: "dd MMM").format(date).toUpperCase();
}
