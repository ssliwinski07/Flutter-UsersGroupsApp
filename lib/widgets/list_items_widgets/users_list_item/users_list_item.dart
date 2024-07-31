import 'package:flutter/material.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

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
    this.usetStore,
  });

  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final UserModel? user;
  final UsersStore? usetStore;

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
                usersStore: widget.usetStore,
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
  @override
  void initState() {
    super.initState();
  }

  String? get group => widget.usersStore!.userGroup?.groupName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserGroup(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const LoadingWidget(path: lottieLoadingDetailsPath);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${context.localize.nameAndLastName}: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        '${widget.user?.userName ?? '-'} ${widget.user?.lastName ?? '-'}',
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${context.localize.postalCodeAndCity}: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: widget.user?.streetName ?? '-',
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: group ?? '-',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> getUserGroup() async {
    await Future.delayed(const Duration(seconds: 4));
    await widget.usersStore!.getUserGroup(userId: widget.user!.userId!);
  }
}
