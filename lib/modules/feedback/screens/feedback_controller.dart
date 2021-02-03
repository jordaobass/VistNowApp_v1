import 'package:get/get.dart';

import '../../../application/values/routes.dart';

abstract class FeedbackController {
  void popToHome();
  void popCurrentPage();
}

class FeedbackControllerImpl extends GetxController
    implements FeedbackController {
  @override
  void popToHome() {
    Get.until((route) => Get.currentRoute == Routes.home);
  }

  @override
  void popCurrentPage() {
    Get.back();
  }
}
