import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  /// Pick image from gallery or camera
  static Future<File?> pickImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 85, // Optional: compress the image
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      log('Image picking failed: $e');
    }
    return null;
  }
}
