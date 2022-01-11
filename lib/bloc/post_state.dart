import "package:equatable/equatable.dart";
import 'package:infinitelist/models/post_model.dart';

class PostState extends Equatable {
  final List<Post> posts;
  final int currentId;

  const PostState({this.posts = const <Post>[], this.currentId = 0});

  PostState copyWith({List<Post>? posts, int? currentId}) {
    return PostState(
      posts: posts ?? this.posts,
      currentId: currentId ?? this.currentId,
    );
  }

  @override
  List<Object> get props => [posts, currentId];
}
