import 'package:get/get.dart';

import '../../../../application/values/routes.dart';

abstract class FavoritesController {
  void navigateToLoginScreen();
}

class FavoritesControllerImpl extends GetxController
    implements FavoritesController {
  @override
  void navigateToLoginScreen() {
    Get.toNamed(Routes.login);
  }
}
