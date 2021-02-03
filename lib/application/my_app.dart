import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:visit_now/modules/feedback/feedback_bindings.dart';
import 'package:visit_now/modules/feedback/screens/feedback_screen.dart';

import '../flavors.dart';
import '../modules/home/home_bindings.dart';
import '../modules/home/screens/create_account/create_account_screen.dart';
import '../modules/home/screens/home_screen.dart';
import '../modules/home/screens/login/login_screen.dart';
import 'application_bindings.dart';
import 'values/application_colors.dart';
import 'values/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return OrientationBuilder(
          builder: (_, orientation) {
            return GetMaterialApp(
              debugShowCheckedModeBanner:
                  FlavorModel.isProduction ? false : true,
              title: 'Visit Now',
              theme: ThemeData(
                primarySwatch: Colors.yellow,
                primaryColor: ApplicationColors.primary,
                primaryColorDark: ApplicationColors.primary,
                cursorColor: ApplicationColors.accent,
                accentColor: ApplicationColors.accent,
                focusColor: ApplicationColors.accent,
                highlightColor: ApplicationColors.accent,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialBinding: ApplicationBindings(),
              builder: (context, widget) {
                ScreenUtil.init(
                  constraints,
                  designSize: Size(360, 720),
                  allowFontScaling: true,
                );

                return widget;
              },
              getPages: [
                GetPage(
                  name: Routes.home,
                  binding: HomeBindings(),
                  page: () => HomeScreen(),
                ),
                GetPage(
                  name: Routes.login,
                  binding: HomeBindings(),
                  page: () => LoginScreen(
                    controller: Get.find(),
                  ),
                  transition: Transition.cupertinoDialog,
                ),
                GetPage(
                  name: Routes.createAccount,
                  binding: HomeBindings(),
                  page: () => CreateAccountScreen(
                    controller: Get.find(),
                  ),
                  transition: Transition.cupertinoDialog,
                ),
                GetPage(
                  name: Routes.feedback,
                  binding: FeedbackBindings(),
                  page: () => FeedbackScreen(
                    controller: Get.find(),
                  ),
                  transition: Transition.cupertinoDialog,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
