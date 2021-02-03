import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: avoid_classes_with_only_static_members
abstract class Dimensions {
  static double get buttonHeight => ScreenUtil().setHeight(52);
  static double get horizontalPadding => ScreenUtil().setWidth(20);
  static double get buttonBorderRadius => ScreenUtil().setHeight(10);

  static double get fullScreenHeight => ScreenUtil().screenHeight;
  static double get fullScreenWidth => ScreenUtil().screenWidth;
}
