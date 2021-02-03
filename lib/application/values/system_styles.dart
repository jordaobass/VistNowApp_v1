import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application_colors.dart';

abstract class SystemStyles {
  static const standard = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: ApplicationColors.secondary,
  );

  static const secondary = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: ApplicationColors.secondary,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: ApplicationColors.secondary,
  );
}
