import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinitelist/bloc/post_bloc.dart';
import 'package:infinitelist/bloc/post_event.dart';
import 'package:infinitelist/models/post_model.dart';
import 'package:infinitelist/widgets/post_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Infinite List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<PostBloc>().add(
                const PostAdded(
                  post: Post(
                    id: 1,
                    title: "hello",
                    description: "abcd",
                  ),
                ),
              );
        },
      ),
      body: const SafeArea(child: PostList()),
    );
  }
}
