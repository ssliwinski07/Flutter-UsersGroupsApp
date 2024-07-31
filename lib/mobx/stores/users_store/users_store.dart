import 'package:mobx/mobx.dart';

import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/core/core.dart';

part 'users_store.g.dart';

class UsersStore = UsersStoreBase with _$UsersStore;

abstract class UsersStoreBase with Store {
  UsersStoreBase({
    required this.databaseService,
  });

  final DatabaseServiceBase databaseService;

  @observable
  ObservableList<UserModel> users = ObservableList<UserModel>();

  @observable
  int usersCounter = 0;

  @observable
  GroupModel? userGroup;

  @action
  void countUsers() {
    usersCounter = users.length;
  }

  @action
  Future<void> deleteUser({required int userId}) async {
    await databaseService.deleteUser(userId: userId);
  }

  @action
  Future<void> getUsers() async {
    users = ObservableList.of(await databaseService.getUsers());
  }

  @action
  Future<void> getUserGroup({required int userId}) async {
    userGroup = await databaseService.getUserGroup(userId: userId);
  }
}
