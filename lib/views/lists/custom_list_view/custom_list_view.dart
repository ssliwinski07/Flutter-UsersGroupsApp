import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/helpers/extensions/go_route.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

//change it to universal ListView widget
class CustomListView<T> extends StatefulWidget {
  const CustomListView({
    super.key,
    this.title,
    this.listView,
    this.items,
    this.backgroundColor = Colors.green,
  });

  final String? title;
  final Widget? listView;
  final List<T>? items;
  final Color? backgroundColor;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
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
            backgroundColor: widget.backgroundColor,
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
        body: widget.items!.isEmpty
            ? const NoItemsInfoWidget()
            //make it more customizable by adding here a widget to pass (for example in that case you can create a widget UsersList)
            : widget.listView ?? const SizedBox.shrink(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.backgroundColor,
        shape: const CircleBorder(),
        onPressed: () {
          try {
            widget.items?.add('Grazyna');
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
