// ignore: file_names
import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

class MessageInfoServiceUi implements MessageInfoServiceBase {
  @override
  showMessage({
    required BuildContext context,
    required String infoMessage,
    required MessageInfoTypes infoType,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _getColor(infoType),
        content: Row(
          children: [
            const Icon(
              Icons.info_sharp,
              color: Colors.white,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Text(
                infoMessage,
                maxLines: 3,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
        dismissDirection: DismissDirection.up,
        duration: Duration(seconds: _getInfoDurationTime(infoType)),
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }

  _getInfoDurationTime(MessageInfoTypes infoType) {
    switch (infoType) {
      case MessageInfoTypes.info:
        return 2;
      case MessageInfoTypes.warrning:
        return 3;
      case MessageInfoTypes.alert:
        return 3;
    }
  }

  _getColor(MessageInfoTypes infoType) {
    switch (infoType) {
      case MessageInfoTypes.info:
        return Colors.black87;
      case MessageInfoTypes.warrning:
        return Colors.orange;
      case MessageInfoTypes.alert:
        return Colors.red;
    }
  }
}
