part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool isSwitch;
  double sliderValue;

  SwitchState({this.isSwitch = true, this.sliderValue = .0});

  SwitchState copyWith({bool? isSwitch, double? sliderValue}) {
    return SwitchState(
        isSwitch: isSwitch ?? this.isSwitch,
        sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  List<Object?> get props => [isSwitch, sliderValue];
}
