import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String description;

  const Post(
      {required this.id, required this.title, required this.description});

  static List<Post> fromJson(List<dynamic> json) {
    List<Post> posts = json.map((dynamic obj) {
      return Post(
        title: obj['title'],
        description: obj['body'],
        id: obj['id'],
      );
    }).toList();

    return posts;
  }

  @override
  List<Object> get props => [id, title, description];
}
