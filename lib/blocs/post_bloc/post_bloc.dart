import 'package:bloc/bloc.dart';
import 'package:bloc_example/utils/post_status.dart';
import 'package:equatable/equatable.dart';

import '../../model/post_item.dart';
import '../../repository/post_repository.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  PostRepository postRepository;

  PostBloc(this.postRepository) : super(const PostStates()) {
    on<PostFetched>(_onPostFetched);
  }

  void _onPostFetched(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.SUCCESS, postList: value, message: "Success"));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.FAILURE, message: error.toString()));
    });
  }
}
