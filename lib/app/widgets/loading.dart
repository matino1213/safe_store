import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFffffff),
      child: Center(
        child: Image.asset(
          'assets/images/loading.gif',
          width: 400,
          height: 300,
        ),
      ),
    );
  }
}
