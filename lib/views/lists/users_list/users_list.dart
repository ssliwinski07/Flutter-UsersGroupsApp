import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';

class UsersList extends StatefulWidget {
  const UsersList({
    super.key,
  });

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  MessageInfoServiceBase get messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  late UsersStore usersStore;

  @override
  void initState() {
    super.initState();
    usersStore = Provider.of<UsersStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const _UsersListLoading();
        }
        return Observer(
          builder: (_) {
            if (usersStore.users.isEmpty) {
              return const NoItemsInfoWidget();
            }
            return ListView.builder(
              itemCount: usersStore.users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = usersStore.users[index];
                return UsersListItem(
                  title: '${user.userName} ${user.lastName}',
                  leadingIcon: Icons.person_4_rounded,
                  onDelete: () async {
                    try {
                      await _deleteUser(userId: user.userId!);

                      if (context.mounted) {
                        messageInfoService.showMessage(
                          infoMessage: context.localize
                              .userRemoved('${user.userName} ${user.lastName}'),
                          infoType: MessageInfoTypes.info,
                          context: context,
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        messageInfoService.showMessage(
                          infoMessage: context.localize.removingUserError(
                              '${user.userName} ${user.lastName}'),
                          infoType: MessageInfoTypes.alert,
                          context: context,
                        );
                      }
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Future<void> _getUsers() async {
    await usersStore.getUsers();
  }

  Future<void> _deleteUser({required int userId}) async {
    await usersStore.deleteUser(userId: userId);
    await _getUsers();
  }
}

class _UsersListLoading extends StatefulWidget {
  const _UsersListLoading();

  @override
  State<_UsersListLoading> createState() => _UsersListLoadingState();
}

class _UsersListLoadingState extends State<_UsersListLoading> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: const ShimmerLoadingWidget.circle(height: 25, width: 25),
        title: ShimmerLoadingWidget.rectangular(
          height: 25,
          borderShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
