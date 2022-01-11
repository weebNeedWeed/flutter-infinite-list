import 'package:flutter/material.dart';
import 'package:infinitelist/models/post_model.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[50],
        child: Text(post.id.toString()),
      ),
      title: Text(post.title),
      subtitle: Text(post.description),
    );
  }
}
