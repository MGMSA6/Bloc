import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/favourite_bloc/favourite_bloc.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      buildWhen: (previous, current) =>
          previous.tempFavouriteList != current.tempFavouriteList,
      builder: (context, state) {
        return Visibility(
            visible: state.tempFavouriteList.isNotEmpty ? true : false,
            child: IconButton(
                onPressed: () {
                  context.read<FavouriteBloc>().add(DeleteItem());
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                )));
      },
    );
  }
}
