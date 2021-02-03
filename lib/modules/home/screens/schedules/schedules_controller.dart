import 'package:get/get.dart';

import '../../../../application/values/routes.dart';

abstract class SchedulesController {
  void navigateToLoginScreen();
}

class SchedulesControllerImpl extends GetxController
    implements SchedulesController {
  @override
  void navigateToLoginScreen() {
    Get.toNamed(Routes.login);
  }
}
