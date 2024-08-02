import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/models/models.dart';

class UsersListItem extends StatefulWidget {
  const UsersListItem({
    super.key,
    this.title,
    this.leadingIcon,
    this.onDelete,
    this.onEdit,
    this.user,
    this.userStore,
  });

  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final UserModel? user;
  final UsersStore? userStore;

  @override
  State<UsersListItem> createState() => _UsersListItemState();
}

class _UsersListItemState extends State<UsersListItem> {
  @override
  Widget build(BuildContext context) {
    return SlidableListTile(
        title: widget.title,
        trailingIcon: widget.leadingIcon,
        onDetails: () async {
          await showDetails(
              context: context,
              detailsWidget: _UserDetails(
                user: widget.user,
                usersStore: widget.userStore,
              ));
        },
        onDelete: () {
          if (widget.onDelete != null) {
            widget.onDelete!();
          }
        },
        onEdit: () {
          if (widget.onEdit != null) {
            widget.onEdit!();
          }
        });
  }
}

class _UserDetails extends StatelessWidget {
  const _UserDetails({
    this.user,
    this.usersStore,
  });

  final UserModel? user;
  final UsersStore? usersStore;

  String? get group => usersStore!.userGroup?.groupName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserGroup(userId: user!.userId!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const LoadingWidget(path: lottieLoadingDetailsPath);
        }
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          text:
                              '${user?.userName ?? '-'} ${user?.lastName ?? '-'}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${context.localize.postalCodeAndCity}: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                      ),
                      text:
                          '${user?.postalCode ?? '-'}, ${user?.cityName ?? '-'}',
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${context.localize.streetName}: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                      ),
                      text: user?.streetName ?? '-',
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) => Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${context.localize.groupName}: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                        ),
                        text: usersStore!.userGroup?.groupName ?? '-',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getUserGroup({required int userId}) async {
    await usersStore!.getUserGroup(userId: userId);
  }
}
