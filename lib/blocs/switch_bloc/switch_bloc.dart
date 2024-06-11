import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';

part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState(isSwitch: false, sliderValue: 0.1)) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<EnableOrDisableSlider>(_enableOrDisableSlider);
  }

  void _enableOrDisableNotification(
      EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _enableOrDisableSlider(
      EnableOrDisableSlider event, Emitter<SwitchState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
