import 'package:flutter/material.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

class NoItemsInfoWidget extends StatelessWidget {
  const NoItemsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.info,
          size: 70,
          color: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          context.localize.emptyListyinfo,
          maxLines: 2,
          style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
