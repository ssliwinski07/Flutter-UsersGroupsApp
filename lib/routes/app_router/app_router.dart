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
              builder: (BuildContext context, GoRouterState state) {
                final args = state.extra as ListViewArgs;

                return CustomListView(
                  title: args.title,
                  listView: args.listView,
                  items: args.items,
                );
              }),
          GoRoute(
              path: groupsScreenView,
              builder: (BuildContext context, GoRouterState state) {
                final args = state.extra as ListViewArgs;

                return CustomListView(
                  title: args.title,
                  listView: args.listView,
                  items: args.items,
                  backgroundColor: args.backgroundColor,
                );
              }),
        ]),
  ]);
}

class ListViewArgs {
  ListViewArgs({
    this.title,
    this.listView,
    this.items,
    this.backgroundColor,
  });

  final String? title;
  final Widget? listView;
  final List<String>? items;
  final Color? backgroundColor;
}
