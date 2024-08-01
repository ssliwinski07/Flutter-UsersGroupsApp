import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Future<void> showDetails({
  required BuildContext context,
  Widget? detailsWidget,
  double? height = 250,
}) async {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: detailsWidget ?? const SizedBox.shrink(),
        ),
      );
    },
  );
}

Future<void> showForm({
  required BuildContext context,
  required GlobalKey<FormBuilderState> formKey,
  Widget? child,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => FormBuilder(
      key: formKey,
      child: child ?? const SizedBox.shrink(),
    ),
  );
}
