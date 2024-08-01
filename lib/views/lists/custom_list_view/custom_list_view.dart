import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_users_group_app/helpers/extensions/go_route.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    super.key,
    this.title,
    this.listView,
    this.formKey,
    this.onActionCallback,
    this.backgroundColor = Colors.green,
  });

  final String? title;
  final Widget? listView;
  final Color? backgroundColor;
  final GlobalKey<FormBuilderState>? formKey;
  final VoidCallback? onActionCallback;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  MessageInfoServiceBase get messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  @override
  void initState() {
    super.initState();
  }

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
        body: widget.listView ?? const NoItemsInfoWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.backgroundColor,
        shape: const CircleBorder(),
        onPressed: () async {
          if (widget.onActionCallback != null) {
            widget.onActionCallback!();
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
