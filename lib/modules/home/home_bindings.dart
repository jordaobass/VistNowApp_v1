import 'package:get/get.dart';

import '../../flavors.dart';
import 'repository/home_repository.dart';
import 'screens/create_account/create_account_controller.dart';
import 'screens/favorites/favorites_controller.dart';
import 'screens/login/login_controller.dart';
import 'screens/map/map_controller.dart';
import 'screens/pre_login/pre_login_controller.dart';
import 'screens/schedules/schedules_controller.dart';
import 'screens/search/search_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
      () => FlavorModel.isMock ? HomeRepositoryMock() : HomeRepositoryImpl(),
    );

    Get.lazyPut<LoginController>(
      () => LoginControllerImpl(),
    );

    Get.lazyPut<PreLoginController>(
      () => PreLoginControllerImpl(),
    );

    Get.lazyPut<CreateAccountController>(
      () => CreateAccountControllerImpl(
        imagePickerAdapter: Get.find(),
      ),
    );

    Get.lazyPut<MapController>(
      () => MapControllerImpl(
        permissionAdapter: Get.find(),
        homeRepository: Get.find(),
      ),
    );

    Get.lazyPut<SearchController>(
      () => SearchControllerImpl(
        repository: Get.find(),
      ),
    );

    Get.lazyPut<FavoritesController>(
      () => FavoritesControllerImpl(),
    );

    Get.lazyPut<SchedulesController>(
      () => SchedulesControllerImpl(),
    );
  }
}
