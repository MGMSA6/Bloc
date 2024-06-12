import 'dart:io';

import 'package:bloc_example/blocs/image_picker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image Picker"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
          if (state.xFile == null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(GalleryImagePicker());
                  },
                  child: const CircleAvatar(
                      child: Icon(Icons.browse_gallery_rounded)),
                )
              ],
            );
          } else {
            return Image.file(File(state.xFile!.path.toString()));
          }
        }),
      ),
    );
  }
}
