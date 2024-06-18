import 'package:bloc_example/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/blocs/favourite_bloc/favourite_bloc.dart';
import 'package:bloc_example/blocs/image_picker/image_picker_bloc.dart';
import 'package:bloc_example/blocs/post_bloc/post_bloc.dart';
import 'package:bloc_example/blocs/switch_bloc/switch_bloc.dart';
import 'package:bloc_example/blocs/todo_bloc/todo_bloc.dart';
import 'package:bloc_example/repository/favourite_repository.dart';
import 'package:bloc_example/repository/post_repository.dart';
import 'package:bloc_example/ui/post_screen.dart';
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
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (context) => PostBloc(PostRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostScreen(),
      ),
    );
  }
}
