import "package:equatable/equatable.dart";
import 'package:infinitelist/models/post_model.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostAdded extends PostEvent {
  final Post post;

  const PostAdded({required this.post});

  @override
  List<Object> get props => [post];
}

class PostFetched extends PostEvent {}
