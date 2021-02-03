import 'package:get/get.dart';

import '../../../../application/values/routes.dart';

// ignore: one_member_abstracts
abstract class PreLoginController {
  void navigateToLoginScreen();
}

class PreLoginControllerImpl extends GetxController
    implements PreLoginController {
  @override
  void navigateToLoginScreen() {
    Get.toNamed(Routes.login);
  }
}
