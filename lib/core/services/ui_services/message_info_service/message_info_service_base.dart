import 'package:flutter/material.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';

abstract interface class MessageInfoServiceBase {
  void showMessage({
    required BuildContext context,
    required String infoMessage,
    required MessageInfoTypes infoType,
  });
}
