import "package:flutter_bloc/flutter_bloc.dart";
import 'package:infinitelist/bloc/post_event.dart';
import 'package:infinitelist/bloc/post_state.dart';
import 'package:infinitelist/helpers/api_helper.dart';
import 'package:infinitelist/models/post_model.dart';
import 'package:rxdart/rxdart.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).switchMap(mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostAdded>(_onPostAdded);
    on<PostFetched>(_onPostFetched,
        transformer: debounce(const Duration(milliseconds: 200)));
  }

  void _onPostAdded(PostAdded event, Emitter<PostState> emit) {
    Post post = event.post;

    List<Post> newList = [...state.posts];
    newList.add(post);

    emit(state.copyWith(posts: newList));
  }

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (!(state.currentId >= 100)) {
      final List<Post> posts =
          await ApiHelper.getPosts(lastId: state.currentId);

      List<Post> newPosts = [...state.posts];
      newPosts.addAll(posts);

      emit(state.copyWith(posts: newPosts, currentId: state.currentId + 20));
    }
  }
}
