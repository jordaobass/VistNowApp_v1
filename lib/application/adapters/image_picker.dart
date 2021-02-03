import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerAdapter {
  Future<File> getImageFromGalery();
  Future<File> getImageFromCamera();
}

class ImagePickerImpl implements ImagePickerAdapter {
  final _picker = ImagePicker();

  @override
  Future<File> getImageFromCamera() async {
    try {
      var pickedFile = await _picker.getImage(source: ImageSource.camera);

      if (pickedFile != null) {
        return File(pickedFile.path);
      }

      return File('');
    } on Exception catch (_) {
      return File('');
    }
  }

  @override
  Future<File> getImageFromGalery() async {
    try {
      var pickedFile = await _picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        return File(pickedFile.path);
      }

      return File('');
    } on Exception catch (_) {
      return File('');
    }
  }
}
