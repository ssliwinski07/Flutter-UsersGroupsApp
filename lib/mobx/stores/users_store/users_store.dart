import 'package:mobx/mobx.dart';

import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/core/core.dart';

part 'users_store.g.dart';

class UsersStore = UsersStoreBase with _$UsersStore;

abstract class UsersStoreBase with Store {
  UsersStoreBase(
      {required this.databaseService,
      required this.zipCodesNetworkServiceBase});

  final DatabaseServiceBase databaseService;
  final ZipCodesNetworkServiceBase zipCodesNetworkServiceBase;

  @observable
  ObservableList<UserModel> users = ObservableList<UserModel>();

  @observable
  int usersCounter = 0;

  @observable
  GroupModel? userGroup;

  @observable
  ZipCodeModel? zipCodeInfo;

  @action
  void clearZipCodeInfo() {
    zipCodeInfo = null;
  }

  @action
  Future<void> deleteUser({required int userId}) async {
    await databaseService.deleteUser(userId: userId);
  }

  @action
  Future<void> getZipCodeInfo({required String zipCode}) async {
    final result =
        await zipCodesNetworkServiceBase.getZipCodeInfo(zipCode: zipCode);

    zipCodeInfo = result.first;
  }

  @action
  Future<void> getUsers() async {
    users = ObservableList.of(await databaseService.getUsers());
  }

  @action
  Future<void> getUserGroup({required int userId}) async {
    userGroup = await databaseService.getUserGroup(userId: userId);
  }

  @action
  Future<void> addUser(
      {required Map<String, dynamic> userJson, required int groupId}) async {
    await databaseService.addUser(
      userJson: userJson,
      groupId: groupId,
    );
  }
}
