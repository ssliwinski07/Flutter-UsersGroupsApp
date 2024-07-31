import 'package:mobx/mobx.dart';

import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/core/core.dart';

part 'groups_store.g.dart';

class GroupsStore = GroupsStoreBase with _$GroupsStore;

abstract class GroupsStoreBase with Store {
  GroupsStoreBase({
    required this.databaseService,
  });

  final DatabaseServiceBase databaseService;

  @observable
  ObservableList<GroupModel> groups = ObservableList<GroupModel>();

  @observable
  ObservableList<UserModel> groupUsers = ObservableList<UserModel>();

  @observable
  int groupsCounter = 0;

  @action
  void countUsers() {
    groupsCounter = groups.length;
  }

  @action
  Future<void> deleteGroup({required int groupId}) async {
    await databaseService.deleteGroup(groupId: groupId);
  }

  @action
  Future<void> getGroups() async {
    groups = ObservableList.of(await databaseService.getUsersGroups());
  }

  @action
  Future<void> getUsersForGroup({required int groupId}) async {
    groupUsers = ObservableList.of(
        await databaseService.getUsersForGroup(groupId: groupId));
  }
}
