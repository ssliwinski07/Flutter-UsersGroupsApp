import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/views/views.dart';
import 'package:flutter_users_group_app/helpers/constans/constans.dart';

class AppRouter {
  final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreenView(),
        routes: <RouteBase>[
          GoRoute(
            path: usersScreenView,
            builder: (BuildContext context, GoRouterState state) =>
                UsersScreenView(
              title: state.uri.queryParameters['title'],
            ),
          ),
        ]),
  ]);
}
