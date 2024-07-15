part of 'posts_bloc.dart';

enum PostsStatus { loading, success, error }

class PostsState extends Equatable {
  final PostsStatus status;
  final List<PostModel> posts;
  final bool hasreachedMax;
  final String errorMessage;

  const PostsState({
    this.status = PostsStatus.loading,
    this.hasreachedMax = false,
    this.posts = const [],
    this.errorMessage = '',
  });

  PostsState copyWith({
    PostsStatus? status,
    List<PostModel>? posts,
    bool? hasreachedMax,
    String? errorMessage,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasreachedMax: hasreachedMax ?? this.hasreachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, posts, hasreachedMax, errorMessage];
}
