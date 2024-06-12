import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

part 'image_picker_event.dart';

part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleyImagePicker);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(xFile: file));
  }

  void _galleyImagePicker(
      GalleryImagePicker event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(xFile: file));
  }
}
