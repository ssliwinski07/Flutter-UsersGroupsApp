import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouteBuildContext on BuildContext {
  void goRouterPop<T>([T? result]) => GoRouter.of(this).pop(result);
}
