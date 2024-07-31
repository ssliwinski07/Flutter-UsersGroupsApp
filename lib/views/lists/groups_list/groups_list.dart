import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';

class GroupsList extends StatefulWidget {
  const GroupsList({
    super.key,
    this.items,
  });

  final List<String?>? items;

  @override
  State<GroupsList> createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  MessageInfoServiceBase get messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items?.length,
      itemBuilder: (BuildContext context, int index) => GroupsListItem(
        title: widget.items?[index],
        leadingIcon: Icons.people,
        onDelete: () {
          try {
            widget.items?.removeAt(index);
            messageInfoService.showMessage(
              infoMessage: context.localize.userRemoved,
              infoType: MessageInfoTypes.info,
              context: context,
            );
            setState(() {});
          } catch (e) {
            messageInfoService.showMessage(
              infoMessage: context.localize.removingUserError,
              infoType: MessageInfoTypes.alert,
              context: context,
            );
          }
        },
      ),
    );
  }
}
