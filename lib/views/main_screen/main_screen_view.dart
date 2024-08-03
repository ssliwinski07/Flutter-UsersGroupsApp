import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_users_group_app/core/core.dart';
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
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      children: const <Widget>[
        _UsersTileWidget(),
        _GroupsTileWidget(),
      ],
    );
  }
}

class _UsersTileWidget extends StatefulWidget {
  const _UsersTileWidget();

  @override
  State<_UsersTileWidget> createState() => _UsersTileWidgetState();
}

class _UsersTileWidgetState extends State<_UsersTileWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  late GroupsStore _groupsStore;
  late UsersStore _usersStore;

  MessageInfoServiceBase get _messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  @override
  void initState() {
    super.initState();
    _groupsStore = Provider.of<GroupsStore>(context, listen: false);
    _usersStore = Provider.of<UsersStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    String? name;
    String? lastName;
    String? streetName;
    String? city;
    String? zipCode;
    GroupModel? group;

    return TileWidget(
      title: context.localize.users,
      icon: Icons.person,
      iconColor: Colors.black,
      onTap: () async {
        context.go(
          usersScreenViewPath,
          extra: ListViewArgs<UserModel>(
            title: context.localize.users,
            listView: const UsersList(),
            formKey: _formKey,
            onActionCallback: () async {
              await showForm(
                context: context,
                formKey: _formKey,
                child: FutureBuilder(
                  future: _getGroupsList(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const LoadingWidget(
                          path: lottieLoadingDetailsPath);
                    }
                    return UserForm(
                      formKey: _formKey,
                      confirmationButtonName: context.localize.add,
                      items: _groupsStore.groups,
                      onNameChange: (value) {
                        name = value!;
                      },
                      onLastNameChange: (value) {
                        lastName = value!;
                      },
                      onStreetNameChange: (value) {
                        streetName = value!;
                      },
                      onCityChange: (value) async {
                        city = value!;
                        // try {
                        //   await _usersStore.getZipCodes(cityName: city!);
                        // } catch (_) {
                        //   if (context.mounted) {
                        //     _messageInfoService.showMessage(
                        //         context: context,
                        //         infoMessage: context.localize
                        //             .fetchingZipCodesError(city!),
                        //         infoType: MessageInfoTypes.alert);
                        //   }
                        // }
                      },
                      onZipCodeChange: (value) async {
                        zipCode = value!;
                        try {
                          await _usersStore.getZipCodeInfo(zipCode: '40-101');
                        } catch (_) {
                          if (context.mounted) {
                            _messageInfoService.showMessage(
                              context: context,
                              infoMessage:
                                  'Error while fetching city based on zip code $zipCode',
                              infoType: MessageInfoTypes.alert,
                            );
                          }
                        }
                      },
                      onGroupChange: (value) {
                        group = value!;
                      },
                      onSubbmit: () async {
                        try {
                          UserModel user = UserModel(
                            userName: name!,
                            lastName: lastName!,
                            streetName: streetName!,
                            postalCode: zipCode!,
                            cityName: city!,
                          );
                          final userToJson = user.toJson();
                          await _addUser(
                            userJson: userToJson,
                            groupId: group!.groupId!,
                          );

                          if (context.mounted) {
                            _messageInfoService.showMessage(
                              context: context,
                              infoMessage: context.localize.userAdded,
                              infoType: MessageInfoTypes.info,
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            _messageInfoService.showMessage(
                              context: context,
                              infoMessage: context.localize.addingUserError,
                              infoType: MessageInfoTypes.alert,
                            );
                          }
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      titleFontSize: 19,
    );
  }

  Future<void> _getGroupsList() async {
    await _groupsStore.getGroups();
  }

  Future<void> _addUser(
      {required Map<String, dynamic> userJson, required int groupId}) async {
    await _usersStore.addUser(userJson: userJson, groupId: groupId);
    await _usersStore.getUsers();
  }
}

class _GroupsTileWidget extends StatefulWidget {
  const _GroupsTileWidget();

  @override
  State<_GroupsTileWidget> createState() => _GroupsTileWidgetState();
}

class _GroupsTileWidgetState extends State<_GroupsTileWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  MessageInfoServiceBase get _messageInfoService => ServiceLocator()
      .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);

  late GroupsStore _groupsStore;

  @override
  void initState() {
    super.initState();
    _groupsStore = Provider.of<GroupsStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    String? groupName;

    return TileWidget(
      title: context.localize.usersGroups,
      icon: Icons.people,
      iconColor: Colors.black,
      onTap: () => context.go(
        groupsScreenViewPath,
        extra: ListViewArgs(
          title: context.localize.usersGroups,
          backgroundColor: Colors.blue,
          listView: const GroupsList(),
          formKey: _formKey,
          onActionCallback: () async {
            await showForm(
              context: context,
              formKey: _formKey,
              child: GroupForm(
                formKey: _formKey,
                confirmationButtonName: context.localize.add,
                onNameChange: (value) {
                  groupName = value!;
                },
                onSubbmit: () async {
                  try {
                    GroupModel group = GroupModel(
                      groupName: groupName!,
                    );
                    final groupToJson = group.toJson();
                    await _addGroup(groupJson: groupToJson);
                    if (context.mounted) {
                      _messageInfoService.showMessage(
                        context: context,
                        infoMessage: context.localize.groupAdded,
                        infoType: MessageInfoTypes.info,
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      _messageInfoService.showMessage(
                        context: context,
                        infoMessage: context.localize.addingGroupError,
                        infoType: MessageInfoTypes.alert,
                      );
                    }
                  }
                },
              ),
            );
          },
        ),
      ),
      titleFontSize: 19,
    );
  }

  Future<void> _addGroup({required Map<String, dynamic> groupJson}) async {
    await _groupsStore.addGroup(groupJson: groupJson);
    await _groupsStore.getGroups();
  }
}
