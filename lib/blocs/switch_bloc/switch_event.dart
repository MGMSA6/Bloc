part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent {}

class EnableOrDisableSlider extends SwitchEvent {
  double sliderValue;

  EnableOrDisableSlider({required this.sliderValue});

  @override
  List<Object?> get props => [sliderValue];
}
