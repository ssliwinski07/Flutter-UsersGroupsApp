import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListTile extends StatefulWidget {
  const SlidableListTile({
    super.key,
    this.title,
    this.trailingIcon,
    this.onDelete,
    this.onEdit,
  });

  final String? title;
  final IconData? trailingIcon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<SlidableListTile> createState() => _SlidableListTileState();
}

class _SlidableListTileState extends State<SlidableListTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const DrawerMotion(),
        children: <Widget>[
          SlidableAction(
            onPressed: (context) {
              if (widget.onEdit != null) {
                widget.onEdit!();
              }
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          )
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const DrawerMotion(),
        children: <Widget>[
          SlidableAction(
            onPressed: (context) {
              if (widget.onDelete != null) {
                widget.onDelete!();
              }
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          maxLines: 1,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
          widget.title ?? '-',
        ),
        trailing: Icon(
          widget.trailingIcon,
        ),
      ),
    );
  }
}
