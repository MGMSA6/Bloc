part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  ImagePickerEvent();

  @override
  List<Object?> get props => [];
}

class CameraCapture extends ImagePickerEvent {}

class GalleryImagePicker extends ImagePickerEvent {}
