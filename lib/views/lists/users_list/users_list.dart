import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
  MessageInfoServiceBase get _messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  final _formKey = GlobalKey<FormBuilderState>();

  late UsersStore _usersStore;
  late GroupsStore _groupsStore;

  @override
  void initState() {
    super.initState();
    _usersStore = Provider.of<UsersStore>(context, listen: false);
    _groupsStore = Provider.of<GroupsStore>(context, listen: false);
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
            if (_usersStore.users.isEmpty) {
              return const NoItemsInfoWidget();
            }
            return ListView.builder(
              itemCount: _usersStore.users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = _usersStore.users[index];
                return UsersListItem(
                  title: '${user.userName} ${user.lastName}',
                  userStore: _usersStore,
                  user: user,
                  leadingIcon: Icons.person_4_rounded,
                  onDelete: () async {
                    try {
                      await _deleteUser(userId: user.userId!);

                      if (context.mounted) {
                        _messageInfoService.showMessage(
                          infoMessage: context.localize
                              .userRemoved('${user.userName} ${user.lastName}'),
                          infoType: MessageInfoTypes.info,
                          context: context,
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        _messageInfoService.showMessage(
                          infoMessage: context.localize.removingUserError(
                              '${user.userName} ${user.lastName}'),
                          infoType: MessageInfoTypes.alert,
                          context: context,
                        );
                      }
                    }
                  },
                  onEdit: () async {
                    await showForm(
                      context: context,
                      formKey: _formKey,
                      child: FutureBuilder(
                        future: _getUserGroup(userId: user.userId!),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return const LoadingWidget(
                                path: lottieLoadingDetailsPath);
                          }
                          return UserForm(
                            user: user,
                            confirmationButtonName: context.localize.edit,
                            group: _usersStore.userGroup,
                            formKey: _formKey,
                            items: _groupsStore.groups,
                            onNameChange: (value) {},
                            onLastNameChange: (value) {},
                            onStreetNameChange: (value) {},
                            onCityChange: (value) {},
                            onZipCodeChange: (value) {},
                            onGroupChange: (value) {},
                            onSubbmit: () async {
                              try {
                                if (context.mounted) {
                                  _messageInfoService.showMessage(
                                    context: context,
                                    infoMessage: context.localize.userModified,
                                    infoType: MessageInfoTypes.info,
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  _messageInfoService.showMessage(
                                    context: context,
                                    infoMessage:
                                        context.localize.modifyingUserError,
                                    infoType: MessageInfoTypes.alert,
                                  );
                                }
                              }
                            },
                          );
                        },
                      ),
                    );
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
    await _usersStore.getUsers();
  }

  Future<void> _getUserGroup({required int userId}) async {
    try {
      await _usersStore.getUserGroup(userId: userId);
    } catch (e) {
      await _groupsStore.getGroups();
    }
  }

  Future<void> _deleteUser({required int userId}) async {
    await _usersStore.deleteUser(userId: userId);
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
