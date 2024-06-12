part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  final XFile? xFile;

  const ImagePickerState({this.xFile});

  ImagePickerState copyWith({XFile? xFile}) {
    return ImagePickerState(xFile: xFile ?? this.xFile);
  }

  @override
  List<Object?> get props => [xFile];
}
