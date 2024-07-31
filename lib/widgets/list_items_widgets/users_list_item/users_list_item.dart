import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/widgets/widgets.dart';

class UsersListItem extends StatefulWidget {
  const UsersListItem({
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
  State<UsersListItem> createState() => _UsersListItemState();
}

class _UsersListItemState extends State<UsersListItem> {
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
