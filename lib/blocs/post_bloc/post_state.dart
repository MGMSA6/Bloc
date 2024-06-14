part of 'post_bloc.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostStates(
      {this.postStatus = PostStatus.LOADING,
      this.postList = const <PostModel>[],
      this.message = ''});

  PostStates copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostStates(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [postStatus, postList, message];
}
