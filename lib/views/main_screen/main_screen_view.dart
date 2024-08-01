import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/views/views.dart';
import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';
import 'package:flutter_users_group_app/routes/app_router/app_router.dart';
import 'package:flutter_users_group_app/helpers/extensions/go_route.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  bool _isLoading = true;

  late SettingsStore _settingsStore;

  @override
  void initState() {
    super.initState();
    _loading();
    _settingsStore = Provider.of<SettingsStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _isLoading
          ? null
          : AppBar(
              backgroundColor: Colors.amberAccent,
              title: Text(
                context.localize.usersAndGroups,
                style: const TextStyle(fontSize: 25.0),
              ),
            ),
      body: Center(
        child: _isLoading
            ? const LoadingWidget(
                path: lottieLoadingIconPath,
              )
            : const _MainContent(),
      ),
      floatingActionButton: _isLoading
          ? null
          : SizedBox(
              height: 50,
              width: 200,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () async {
                  await _settingsStore.updateLocale(
                    value: _buildLocaleValue(),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.amberAccent,
                child: Observer(
                    builder: (_) => Text(
                        '${context.localize.changeLanguage}: ${_getLanguageCode()}')),
              ),
            ),
    );
  }

  Future<void> _loading() async {
    //loading data simulation
    await Future.delayed(const Duration(seconds: 4));
    await _settingsStore.getLocale();
    if (mounted) {
      _isLoading = !_isLoading;
      setState(() {});
    }
  }

  String _getLanguageCode() {
    if (_settingsStore.locale == pl) {
      return en.toUpperCase();
    }
    return pl.toUpperCase();
  }

  String _buildLocaleValue() {
    String locale = en;
    if (_settingsStore.locale == en) {
      locale = pl;
      return locale;
    }
    return locale;
  }
}

class _MainContent extends StatefulWidget {
  const _MainContent();

  @override
  State<_MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<_MainContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    String userName;
    String lastName;
    String streetName;
    String zipCode;
    String cityName;
    String groupName;
    List<String> items = ['Admin', 'Dupa'];
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      children: <Widget>[
        TileWidget(
          title: context.localize.users,
          icon: Icons.person,
          iconColor: Colors.black,
          onTap: () async {
            context.go(
              usersScreenViewPath,
              extra: ListViewArgs<UserModel>(
                title: context.localize.users,
                listView: const UsersList(),
                formKey: formKey,
                onActionCallback: () async {
                  await showForm(
                    context: context,
                    formKey: formKey,
                    child: AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FormBuilderTextField(
                            name: context.localize.name,
                            decoration: InputDecoration(
                                labelText: context.localize.name),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: context.localize.requiredField,
                              ),
                            ]),
                            onChanged: (value) {
                              userName = value!;
                              debugPrint(userName);
                            },
                          ),
                          FormBuilderTextField(
                            name: context.localize.lastName,
                            decoration: InputDecoration(
                                labelText: context.localize.lastName),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: context.localize.requiredField,
                              ),
                            ]),
                            onChanged: (value) {
                              lastName = value!;
                              debugPrint(lastName);
                            },
                          ),
                          FormBuilderTextField(
                            name: context.localize.streetName,
                            decoration: InputDecoration(
                                labelText: context.localize.streetName),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: context.localize.requiredField,
                              ),
                            ]),
                            onChanged: (value) {
                              streetName = value!;
                              debugPrint(streetName);
                            },
                          ),
                          FormBuilderTextField(
                            name: context.localize.zipCode,
                            inputFormatters: [Formatters().zipCodeFormatter],
                            decoration: InputDecoration(
                                hintText: '##-###',
                                labelText: context.localize.zipCode),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: context.localize.requiredField,
                              ),
                            ]),
                            onChanged: (value) {
                              zipCode = value!;
                              debugPrint(zipCode);
                            },
                          ),
                          FormBuilderTextField(
                            name: context.localize.cityName,
                            decoration: InputDecoration(
                                labelText: context.localize.cityName),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: context.localize.requiredField,
                                ),
                              ],
                            ),
                            onChanged: (value) {
                              cityName = value!;
                              debugPrint(cityName);
                            },
                          ),
                          FormBuilderDropdown<String>(
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
                            items: items
                                .map(
                                  (e) => DropdownMenuItem(
                                      value: e, child: Text(e)),
                                )
                                .toList(),
                            onChanged: (value) {
                              groupName = value!;
                              debugPrint(groupName);
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
                                child: Text(context.localize.cancel,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  if (formKey.currentState?.saveAndValidate() ??
                                      false) {
                                    if (true) {
                                      debugPrint('SUCCESS');
                                    }
                                  }
                                },
                                child: Text(context.localize.add,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          titleFontSize: 19,
        ),
        TileWidget(
          title: context.localize.usersGroups,
          icon: Icons.people,
          iconColor: Colors.black,
          onTap: () => context.go(
            groupsScreenViewPath,
            extra: ListViewArgs(
              title: context.localize.usersGroups,
              backgroundColor: Colors.blue,
              listView: const GroupsList(),
            ),
          ),
          titleFontSize: 19,
        )
      ],
    );
  }
}
