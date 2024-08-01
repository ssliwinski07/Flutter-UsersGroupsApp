import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/views/views.dart';
import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/mobx/stores/stores.dart';
import 'package:flutter_users_group_app/routes/app_router/app_router.dart';

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
                    child: UserForm(
                      formKey: formKey,
                      items: [
                        GroupModel(groupName: 'TEST'),
                        GroupModel(groupName: 'ADMIN')
                      ],
                      onNameChange: (value) {
                        String name = value!;
                        debugPrint(name);
                      },
                      onLastNameChange: (value) {
                        String lastName = value!;
                        debugPrint(lastName);
                      },
                      onStreetNameChange: (value) {
                        String streetName = value!;
                        debugPrint(streetName);
                      },
                      onCityChange: (value) {
                        String city = value!;
                        debugPrint(city);
                      },
                      onZipCodeChange: (value) {
                        String zipCode = value!;
                        debugPrint(zipCode);
                      },
                      onGroupChange: (value) {
                        GroupModel group = value!;
                        debugPrint('Group: ${group.groupName}');
                      },
                      onSubbmit: () {
                        debugPrint('success');
                      },
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
