import 'package:get/get.dart';

import 'screens/feedback_controller.dart';

class FeedbackBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(
      () => FeedbackControllerImpl(),
      fenix: true,
    );
  }
}
