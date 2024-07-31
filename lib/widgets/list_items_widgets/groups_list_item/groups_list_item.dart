import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/models/models.dart';

class GroupsListItem extends StatefulWidget {
  const GroupsListItem({
    super.key,
    this.leadingIcon,
    this.onDelete,
    this.onEdit,
    this.groupId,
    this.groupStore,
    this.groupName,
  });

  final IconData? leadingIcon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final int? groupId;
  final String? groupName;
  final GroupsStore? groupStore;

  @override
  State<GroupsListItem> createState() => _GroupsListItemState();
}

class _GroupsListItemState extends State<GroupsListItem> {
  @override
  Widget build(BuildContext context) {
    return SlidableListTile(
        title: widget.groupName,
        trailingIcon: widget.leadingIcon,
        onDetails: () async {
          await showDetails(
            context: context,
            detailsWidget: _GroupDetails(
              groupId: widget.groupId,
              groupName: widget.groupName,
              groupsStore: widget.groupStore,
            ),
          );
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

class _GroupDetails extends StatelessWidget {
  const _GroupDetails({
    this.groupsStore,
    this.groupName,
    this.groupId,
  });

  final GroupsStore? groupsStore;
  final String? groupName;
  final int? groupId;

  List<UserModel> get groupUsers => groupsStore!.groupUsers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsersForGroup(groupId: groupId!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const LoadingWidget(path: lottieLoadingDetailsPath);
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      text: '$groupName',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                          ),
                          text: _buildGroupUsers() ?? '-',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String? _buildGroupUsers() {
    final sb = StringBuffer();

    for (UserModel item in groupsStore!.groupUsers) {
      sb.writeln('${item.userName} ${item.lastName}');
    }

    return sb.toString();
  }

  Future<void> _getUsersForGroup({required int groupId}) async {
    await groupsStore!.getUsersForGroup(groupId: groupId);
  }
}
