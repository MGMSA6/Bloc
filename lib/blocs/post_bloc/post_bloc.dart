import 'package:bloc/bloc.dart';
import 'package:bloc_example/utils/post_status.dart';
import 'package:equatable/equatable.dart';

import '../../model/post_item.dart';
import '../../repository/post_repository.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  PostRepository postRepository;
  List<PostModel> tempPostList = [];

  PostBloc(this.postRepository) : super(const PostStates()) {
    on<PostFetched>(_onPostFetched);
    on<SearchItem>(_filterList);
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

  void _filterList(SearchItem event, Emitter<PostStates> emit) async {
    if (event.strString.isEmpty) {
      emit(state.copyWith(temPostList: [], searchMessage: ''));
    } else {
      tempPostList = state.postList
          .where((element) =>
              element.email.toString().toLowerCase().contains(event.strString.toLowerCase()))
          .toList();
      if (tempPostList.isEmpty) {
        emit(state.copyWith(
            temPostList: tempPostList, searchMessage: 'No Data Found'));
      } else {
        emit(state.copyWith(temPostList: tempPostList));
      }
    }
    emit(state.copyWith(temPostList: tempPostList, searchMessage: ''));
  }
}
