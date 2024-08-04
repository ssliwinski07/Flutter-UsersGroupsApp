import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/models/models.dart';
import 'package:mobx/mobx.dart';

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

class _UserDetails extends StatefulWidget {
  const _UserDetails({
    this.user,
    this.usersStore,
  });

  final UserModel? user;
  final UsersStore? usersStore;

  @override
  State<_UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<_UserDetails> {
  late Observable<String?> groupName;

  @override
  void initState() {
    super.initState();

    groupName = Observable(widget.usersStore!.userGroup?.groupName);

    reaction((_) => widget.usersStore!.userGroup?.groupName, (group) {
      runInAction(() {
        groupName.value = group;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserGroup(userId: widget.user!.userId!),
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
                              '${widget.user?.userName ?? '-'} ${widget.user?.lastName ?? '-'}',
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
                          '${widget.user?.postalCode ?? '-'}, ${widget.user?.cityName ?? '-'}',
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
                      text: widget.user?.streetName ?? '-',
                    ),
                  ],
                ),
              ),
              Text.rich(
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
                      text: groupName.value ?? '-',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getUserGroup({required int userId}) async {
    await widget.usersStore!.getUserGroup(userId: userId);
  }
}
