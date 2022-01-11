import 'package:flutter/material.dart';

class BottomLoading extends StatelessWidget {
  const BottomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/loading.gif',
      width: 50,
      height: 50,
    );
  }
}
