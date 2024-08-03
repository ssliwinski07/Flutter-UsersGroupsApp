import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:async';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/helpers/extensions/go_route.dart';
import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';

class UserForm extends StatefulWidget {
  const UserForm({
    super.key,
    required this.confirmationButtonName,
    required this.items,
    required this.formKey,
    this.onNameChange,
    this.onLastNameChange,
    this.onStreetNameChange,
    this.onZipCodeChange,
    this.onCityChange,
    this.onGroupChange,
    this.onSubbmit,
    this.user,
    this.group,
  });

  final List<GroupModel> items;
  final UserModel? user;
  final GroupModel? group;
  final GlobalKey<FormBuilderState> formKey;
  final FunctionCallback<String> onNameChange;
  final FunctionCallback<String> onLastNameChange;
  final FunctionCallback<String> onStreetNameChange;
  final FunctionCallback<String> onZipCodeChange;
  final FunctionCallback<String> onCityChange;
  final FunctionCallback<GroupModel> onGroupChange;
  final VoidCallback? onSubbmit;
  final String confirmationButtonName;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late UsersStore _userStore;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _userStore = Provider.of<UsersStore>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FormBuilderTextField(
            name: userNameForm,
            initialValue: widget.user?.userName ?? '',
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
            name: userLastNameForm,
            initialValue: widget.user?.lastName ?? '',
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
            name: streetNameForm,
            initialValue: widget.user?.streetName ?? '',
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
            name: cityForm,
            initialValue: widget.user?.cityName ?? '',
            decoration: InputDecoration(labelText: context.localize.cityName),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: context.localize.requiredField,
                ),
              ],
            ),
            onChanged: _onCityChanged,
          ),
          //change it to dropdown menu
          Observer(
            builder: (_) => FormBuilderDropdown<String>(
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: context.localize.requiredField,
                  ),
                ],
              ),
              name: zipCodeForm,
              initialValue: widget.user?.postalCode ?? '',
              decoration: InputDecoration(
                label: Text(
                  context.localize.zipCode,
                ),
              ),
              disabledHint: Text(context.localize.noZipCodes),
              items: _userStore.zipCodes
                  .map(
                    (element) => DropdownMenuItem(
                        value: element,
                        child: Text(
                          element,
                        )),
                  )
                  .toList(),
              onChanged: (value) {
                if (widget.onZipCodeChange != null) {
                  widget.onZipCodeChange!(value);
                }
              },
            ),
          ),
          FormBuilderDropdown<GroupModel>(
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: context.localize.requiredField,
                ),
              ],
            ),
            name: usersGroupsForm,
            initialValue: widget.group,
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
                child: Text(widget.confirmationButtonName,
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onCityChanged(String? value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 3), () {
      if (value != null && value.isNotEmpty) {
        widget.onCityChange!(value);
      }
    });
  }
}


// FormBuilderTextField(
//             name: zipCodeForm,
//             initialValue: widget.user?.postalCode ?? '',
//             inputFormatters: [Formatters().zipCodeFormatter],
//             decoration: InputDecoration(
//               hintText: '##-###',
//               labelText: context.localize.zipCode,
//             ),
//             validator: FormBuilderValidators.compose(
//               [
//                 FormBuilderValidators.required(
//                   errorText: context.localize.requiredField,
//                 ),
//               ],
//             ),
//             onChanged: (value) {
//               if (widget.onZipCodeChange != null) {
//                 widget.onZipCodeChange!(value);
//               }
//             },
//           ),