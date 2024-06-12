import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    final XFile? xFile =
        await _imagePicker.pickImage(source: ImageSource.camera);
    return xFile;
  }

  Future<XFile?> pickImageFromGallery() async {
    final XFile? xFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    return xFile;
  }
}
