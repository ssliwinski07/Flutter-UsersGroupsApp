import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/widgets/widgets.dart';

class GroupsListItem extends StatefulWidget {
  const GroupsListItem({
    super.key,
    this.title,
    this.leadingIcon,
    this.onDelete,
    this.onEdit,
  });

  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<GroupsListItem> createState() => _GroupsListItemState();
}

class _GroupsListItemState extends State<GroupsListItem> {
  @override
  Widget build(BuildContext context) {
    return SlidableListTile(
        title: widget.title,
        trailingIcon: widget.leadingIcon,
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
