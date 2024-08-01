import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/helpers/extensions/go_route.dart';
import 'package:flutter_users_group_app/models/models.dart';

typedef FunctionCallback<T> = void Function(T?)?;

class UserForm extends StatefulWidget {
  const UserForm({
    super.key,
    this.onNameChange,
    this.onLastNameChange,
    this.onStreetNameChange,
    this.onZipCodeChange,
    this.onCityChange,
    this.onGroupChange,
    this.onSubbmit,
    required this.items,
    required this.formKey,
  });

  final List<GroupModel> items;
  final GlobalKey<FormBuilderState> formKey;
  final FunctionCallback<String> onNameChange;
  final FunctionCallback<String> onLastNameChange;
  final FunctionCallback<String> onStreetNameChange;
  final FunctionCallback<String> onZipCodeChange;
  final FunctionCallback<String> onCityChange;
  final FunctionCallback<GroupModel> onGroupChange;
  final VoidCallback? onSubbmit;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FormBuilderTextField(
            name: context.localize.name,
            decoration: InputDecoration(labelText: context.localize.name),
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
          FormBuilderTextField(
            name: context.localize.lastName,
            decoration: InputDecoration(labelText: context.localize.lastName),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: context.localize.requiredField,
              ),
            ]),
            onChanged: (value) {
              if (widget.onLastNameChange != null) {
                widget.onLastNameChange!(value);
              }
            },
          ),
          FormBuilderTextField(
            name: context.localize.streetName,
            decoration: InputDecoration(labelText: context.localize.streetName),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: context.localize.requiredField,
              ),
            ]),
            onChanged: (value) {
              if (widget.onStreetNameChange != null) {
                widget.onStreetNameChange!(value);
              }
            },
          ),
          FormBuilderTextField(
            name: context.localize.zipCode,
            inputFormatters: [Formatters().zipCodeFormatter],
            decoration: InputDecoration(
              hintText: '##-###',
              labelText: context.localize.zipCode,
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: context.localize.requiredField,
                ),
              ],
            ),
            onChanged: (value) {
              if (widget.onZipCodeChange != null) {
                widget.onZipCodeChange!(value);
              }
            },
          ),
          FormBuilderTextField(
            name: context.localize.cityName,
            decoration: InputDecoration(labelText: context.localize.cityName),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: context.localize.requiredField,
                ),
              ],
            ),
            onChanged: (value) {
              if (widget.onCityChange != null) {
                widget.onCityChange!(value);
              }
            },
          ),
          FormBuilderDropdown<GroupModel>(
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: context.localize.requiredField,
                ),
              ],
            ),
            name: context.localize.usersGroups,
            decoration: InputDecoration(
              label: Text(
                context.localize.usersGroups,
              ),
            ),
            disabledHint: Text(context.localize.noGroups),
            items: widget.items
                .map(
                  (element) => DropdownMenuItem(
                      value: element,
                      child: Text(
                        element.groupName,
                      )),
                )
                .toList(),
            onChanged: (value) {
              if (widget.onGroupChange != null) {
                widget.onGroupChange!(value);
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
