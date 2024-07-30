import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/helpers/extensions/go_route.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

//change it to universal ListView widget
class UsersScreenView extends StatefulWidget {
  const UsersScreenView({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<UsersScreenView> createState() => _UsersScreenViewState();
}

class _UsersScreenViewState extends State<UsersScreenView> {
  List<String> names = ['Szymon', 'Gosia', 'Wojtek', 'Adam'];

  MessageInfoServiceBase get messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green,
            floating: true,
            snap: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: GestureDetector(
                child: const Icon(Icons.arrow_back_ios),
                onTap: () => context.goRouterPop(),
              ),
            ),
            title: Text(widget.title!),
          )
        ],
        body: names.isEmpty
            ? const NoItemsInfoWidget()
            //make it more customizable by adding here a widget to pass (for example in that case you can create a widget UsersList)
            : ListView.builder(
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
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        onPressed: () {
          try {
            names.add('Grazyna');
            messageInfoService.showMessage(
              infoMessage: context.localize.userAdded,
              infoType: MessageInfoTypes.info,
              context: context,
            );
            setState(() {});
          } catch (e) {
            messageInfoService.showMessage(
              infoMessage: context.localize.addingUserError,
              infoType: MessageInfoTypes.alert,
              context: context,
            );
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
