import 'package:bloc_example/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleStates extends StatefulWidget {
  const MultipleStates({super.key});

  @override
  State<MultipleStates> createState() => _MultipleStatesState();
}

class _MultipleStatesState extends State<MultipleStates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Multiple States"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 15),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      print("Notification");
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            context
                                .read<SwitchBloc>()
                                .add(EnableOrDisableNotification());
                          });
                    })
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(state.sliderValue)),
              );
            }),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              print("Slider");
              return Slider(
                  value: state.sliderValue,
                  onChanged: (newValue) {
                    context
                        .read<SwitchBloc>()
                        .add(EnableOrDisableSlider(sliderValue: newValue));
                  });
            })
          ],
        ),
      ),
    );
  }
}
