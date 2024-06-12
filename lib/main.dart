import 'package:bloc_example/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/blocs/image_picker/image_picker_bloc.dart';
import 'package:bloc_example/blocs/switch_bloc/switch_bloc.dart';
import 'package:bloc_example/ui/counter_screen.dart';
import 'package:bloc_example/ui/image_picker_screen.dart';
import 'package:bloc_example/ui/multiple_states.dart';
import 'package:bloc_example/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
