import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/helpers/extensions/go_route.dart';

class GroupForm extends StatefulWidget {
  const GroupForm({
    super.key,
    required this.formKey,
    this.onNameChange,
    this.onSubbmit,
  });

  final GlobalKey<FormBuilderState> formKey;
  final FunctionCallback<String> onNameChange;
  final VoidCallback? onSubbmit;

  @override
  State<GroupForm> createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupForm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FormBuilderTextField(
            name: groupNameForm,
            decoration: InputDecoration(labelText: context.localize.groupName),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: context.localize.requiredField,
              ),
            ]),
            onChanged: (value) {
              if (widget.onNameChange != null) {
                widget.onNameChange!(value);
              }
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  context.goRouterPop();
                },
                child: Text(
                  context.localize.cancel,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () async {
                  if (widget.formKey.currentState?.saveAndValidate() ?? false) {
                    if (true) {
                      if (widget.onSubbmit != null) {
                        widget.onSubbmit!();
                        context.goRouterPop();
                      }
                    }
                  }
                },
                child: Text(context.localize.add,
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
