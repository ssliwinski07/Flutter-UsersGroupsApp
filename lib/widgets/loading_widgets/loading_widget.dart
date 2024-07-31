import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.path,
  });

  final String? path;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      path!,
      repeat: true,
    );
  }
}
