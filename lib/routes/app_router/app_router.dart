import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/views/views.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
                  formKey: args.formKey,
                  onActionCallback: args.onActionCallback,
                );
              }),
          GoRoute(
              path: groupsScreenView,
              builder: (BuildContext context, GoRouterState state) {
                final args = state.extra as ListViewArgs;

                return CustomListView(
                  title: args.title,
                  listView: args.listView,
                  backgroundColor: args.backgroundColor,
                  formKey: args.formKey,
                  onActionCallback: args.onActionCallback,
                );
              }),
        ]),
  ]);
}

class ListViewArgs<T> {
  ListViewArgs({
    this.title,
    this.listView,
    this.backgroundColor,
    this.formKey,
    this.onActionCallback,
  });

  final String? title;
  final Widget? listView;
  final Color? backgroundColor;
  final GlobalKey<FormBuilderState>? formKey;
  final VoidCallback? onActionCallback;
}
