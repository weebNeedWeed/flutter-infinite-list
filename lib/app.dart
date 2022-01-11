import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinitelist/bloc/post_bloc.dart';
import 'package:infinitelist/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Infinite List",
      home: BlocProvider(
        create: (_) => PostBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
