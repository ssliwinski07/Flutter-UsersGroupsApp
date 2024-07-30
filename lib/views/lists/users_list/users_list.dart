import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<String> names = ['Szymon', 'Gosia', 'Wojtek', 'Adam'];

  MessageInfoServiceBase get messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) => UsersListItem(
        title: names[index],
        trailingIcon: Icons.person_4_rounded,
        onDelete: () {
          try {
            names.removeAt(index);
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
