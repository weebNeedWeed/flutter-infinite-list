import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinitelist/bloc/post_bloc.dart';
import 'package:infinitelist/bloc/post_event.dart';
import 'package:infinitelist/bloc/post_state.dart';
import 'package:infinitelist/models/post_model.dart';
import 'package:infinitelist/widgets/bottom_loading.dart';
import 'package:infinitelist/widgets/post_item.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<PostBloc>().add(PostFetched());

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    double currentScrollPosition = _scrollController.offset;

    if (currentScrollPosition >= (maxScrollExtent * 0.95)) {
      context.read<PostBloc>().add(PostFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildListPost(List<Post> posts) {
      return ListView.builder(
        controller: _scrollController,
        itemCount: posts.length + 1,
        itemBuilder: (context, index) {
          if (index == posts.length) {
            return const BottomLoading();
          }

          return PostItem(post: posts[index]);
        },
      );
    }

    return BlocBuilder<PostBloc, PostState>(
      builder: (context, PostState state) {
        return _buildListPost(state.posts);
      },
    );
  }
}
