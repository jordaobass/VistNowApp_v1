import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../application/values/application_colors.dart';

// ignore: avoid_classes_with_only_static_members
abstract class TextStyles {
  static TextStyle get loginButton => TextStyle(
        fontSize: ScreenUtil().setSp(15),
        fontWeight: FontWeight.w600,
      );

  static TextStyle genericLabel(double size, Color color, FontWeight weight) =>
      TextStyle(
        color: color,
        fontSize: ScreenUtil().setSp(size),
        fontWeight: weight,
      );

  static TextStyle get textFieldInput => TextStyle(
        fontSize: ScreenUtil().setSp(18),
        fontWeight: FontWeight.w400,
        color: ApplicationColors.grey,
      );

  static TextStyle get textFieldLabel => TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: FontWeight.w500,
        color: ApplicationColors.black,
      );
  static TextStyle get hintTextField => TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: FontWeight.w400,
        color: ApplicationColors.mediumGrey,
      );

  static TextStyle get customDividerText => TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w400,
        color: ApplicationColors.mediumGrey,
      );

  static TextStyle get modalTitle => TextStyle(
        fontSize: ScreenUtil().setSp(20),
        fontWeight: FontWeight.w600,
        color: ApplicationColors.black,
      );

  static TextStyle get feedbackTitle => TextStyle(
        fontSize: ScreenUtil().setSp(20),
        fontWeight: FontWeight.w700,
        color: ApplicationColors.black,
      );

  static TextStyle get feedbackDescription => TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w500,
        color: ApplicationColors.grey,
      );

  static TextStyle get informationText => TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: FontWeight.w600,
        color: ApplicationColors.grey,
      );

  static TextStyle get itemPlaceTitle => TextStyle(
        color: ApplicationColors.accent,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(16),
        letterSpacing: ScreenUtil().setSp(0.5),
      );
  static TextStyle get itemPlaceSubtitle => TextStyle(
        color: ApplicationColors.mediumGrey,
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(16),
        letterSpacing: ScreenUtil().setSp(0.2),
      );
  static TextStyle get itemPlaceValue => TextStyle(
        fontSize: ScreenUtil().setSp(14),
        color: ApplicationColors.black,
        letterSpacing: ScreenUtil().setSp(0.3),
        fontWeight: FontWeight.w500,
      );
  static TextStyle get itemPlaceState => TextStyle(
        fontSize: ScreenUtil().setSp(14),
        color: ApplicationColors.grey,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get searchHotelTitle => TextStyle(
        fontSize: ScreenUtil().setSp(20),
        color: ApplicationColors.accent,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get searchHotelDescription => TextStyle(
        fontSize: ScreenUtil().setSp(12),
        color: ApplicationColors.mediumGrey,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get hintSearchFieldStyle => TextStyle(
        fontSize: ScreenUtil().setSp(15),
        color: ApplicationColors.grey,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get contentSearchFieldStyle => TextStyle(
        fontSize: ScreenUtil().setSp(16),
        color: ApplicationColors.grey,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get genericEmptyScreenTitle => TextStyle(
        fontSize: ScreenUtil().setSp(24),
        color: ApplicationColors.black,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get genericEmptyScreenDescription => TextStyle(
        fontSize: ScreenUtil().setSp(16),
        color: ApplicationColors.black,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get genericRedLabel => TextStyle(
        fontSize: ScreenUtil().setSp(18),
        color: ApplicationColors.accent,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get filterLabel => TextStyle(
        fontSize: ScreenUtil().setSp(16),
        color: ApplicationColors.grey,
        fontWeight: FontWeight.w300,
      );
}
