import 'package:geolocator/geolocator.dart';

import '../models/latitude_longitude.dart';

abstract class PermissionAdapter {
  Future<void> requestLocalizationPermission();
  Future<LatitudeLongitude> getCurrentUserPosition();
}

class PermissionHandler implements PermissionAdapter {
  Future<bool> _checkIfHasLocalizationPermission() {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<void> requestLocalizationPermission() async {
    bool isPermissionGranted;

    try {
      isPermissionGranted = await _checkIfHasLocalizationPermission();
    } on Exception catch (_) {
      isPermissionGranted = false;
    }

    if (isPermissionGranted) {
      return;
    }

    try {
      await Geolocator.requestPermission();
    } on Exception catch (_) {
      // throw LocalizationFailure(message: Strings.localizationError);
    }
  }

  @override
  Future<LatitudeLongitude> getCurrentUserPosition() async {
    var defaultLocalization = LatitudeLongitude(
      latitude: -22.9027056,
      longitude: -43.1811321,
    );

    bool isPermissionGranted;

    try {
      isPermissionGranted = await _checkIfHasLocalizationPermission();
    } on Exception catch (_) {
      isPermissionGranted = false;
    }

    if (!isPermissionGranted) {
      return defaultLocalization;
    }

    try {
      var currentPosition = await Geolocator.getCurrentPosition();

      return LatitudeLongitude(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
      );
    } on Exception catch (_) {
      return defaultLocalization;
    }
  }
}
