import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../flavors.dart';
import 'adapters/image_picker.dart';
import 'adapters/permission.dart';
import 'adapters/safe_local_storage.dart';
import 'controllers/authentication_controller.dart';
import 'repository/application_repository.dart';
import 'repository/authentication_repository.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(baseUrl: FlavorModel.baseURL),
      ),
    );

    Get.lazyPut<SafeLocalStoragePermissionAdapter>(
      () => FlutterSecureLocalStorage(),
    );

    Get.lazyPut<ApplicationRepository>(
      () => FlavorModel.isMock
          ? ApplicationRepositoryMock()
          : ApplicationRepositoryImpl(localStorage: Get.find()),
    );

    Get.put<AuthenticationRepository>(
      FlavorModel.isMock
          ? AuthenticationRepositoryMock()
          : AuthenticationRepositoryImpl(
              http: Get.find(),
            ),
    );

    Get.lazyPut<AuthenticationController>(
      () => AuthenticationControllerImpl(
        applicationRepository: Get.find(),
        authenticationRepository: Get.find(),
      ),
    );

    Get.lazyPut<PermissionAdapter>(
      () => PermissionHandler(),
    );

    Get.lazyPut<ImagePickerAdapter>(
      () => ImagePickerImpl(),
      fenix: true,
    );
  }
}
