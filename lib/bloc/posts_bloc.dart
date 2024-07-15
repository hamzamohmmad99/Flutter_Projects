import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infite_secroll/model/post_model.dart';
import 'package:infite_secroll/service/posts_service.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        if (state.hasreachedMax) return;
        try {
          if (state.status == PostsStatus.loading) {
            final posts = await Service.getPosts();
            return posts.isEmpty
                ? emit(state.copyWith(
                    hasreachedMax: true,
                  ))
                : emit(
                    state.copyWith(
                      status: PostsStatus.success,
                      hasreachedMax: false,
                    ),
                  );
          } else {
            final posts = await Service.getPosts(state.posts.length);
            posts.isEmpty
                ? emit(state.copyWith(hasreachedMax: true))
                : emit(
                    state.copyWith(
                      status: PostsStatus.success,
                      posts: List.of(state.posts)..addAll(posts),
                      hasreachedMax: false,
                    ),
                  );
          }
        } catch (e) {
          emit(
            state.copyWith(
              status: PostsStatus.error,
              errorMessage: 'failed to fetch posts',
            ),
          );
        }
      }
    }, transformer: droppable());
  }
}
