import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_users_group_app/helpers/constans/constans.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(lottieLoadingIconPath, repeat: true);
  }
}
