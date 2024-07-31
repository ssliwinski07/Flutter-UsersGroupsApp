import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';

class GroupsList extends StatefulWidget {
  const GroupsList({
    super.key,
  });

  @override
  State<GroupsList> createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  MessageInfoServiceBase get messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  late GroupsStore groupsStore;

  @override
  void initState() {
    super.initState();
    groupsStore = Provider.of<GroupsStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getGroups(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const _GroupsListLoading();
        }
        return Observer(
          builder: (_) {
            if (groupsStore.groups.isEmpty) {
              return const NoItemsInfoWidget();
            }
            return ListView.builder(
                itemCount: groupsStore.groups.length,
                itemBuilder: (BuildContext context, int index) {
                  final group = groupsStore.groups[index];
                  return GroupsListItem(
                    title: group.groupName,
                    leadingIcon: Icons.people,
                    onDelete: () async {
                      try {
                        await _deleteGroup(groupId: group.groupId!);

                        if (context.mounted) {
                          messageInfoService.showMessage(
                            infoMessage:
                                context.localize.groupRemoved(group.groupName),
                            infoType: MessageInfoTypes.info,
                            context: context,
                          );
                        }
                      } catch (_) {
                        if (context.mounted) {
                          messageInfoService.showMessage(
                            infoMessage: context.localize
                                .removingGroupError(group.groupName),
                            infoType: MessageInfoTypes.alert,
                            context: context,
                          );
                        }
                      }
                    },
                  );
                });
          },
        );
      },
    );
  }

  Future<void> _getGroups() async {
    await groupsStore.getGroups();
  }

  Future<void> _deleteGroup({required int groupId}) async {
    await groupsStore.deleteGroup(groupId: groupId);
    await _getGroups();
  }
}

class _GroupsListLoading extends StatefulWidget {
  const _GroupsListLoading();

  @override
  State<_GroupsListLoading> createState() => _GroupsListLoadingState();
}

class _GroupsListLoadingState extends State<_GroupsListLoading> {
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
