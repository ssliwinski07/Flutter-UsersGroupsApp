// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupsStore on GroupsStoreBase, Store {
  late final _$groupsAtom =
      Atom(name: 'GroupsStoreBase.groups', context: context);

  @override
  ObservableList<GroupModel> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(ObservableList<GroupModel> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  late final _$groupUsersAtom =
      Atom(name: 'GroupsStoreBase.groupUsers', context: context);

  @override
  ObservableList<UserModel> get groupUsers {
    _$groupUsersAtom.reportRead();
    return super.groupUsers;
  }

  @override
  set groupUsers(ObservableList<UserModel> value) {
    _$groupUsersAtom.reportWrite(value, super.groupUsers, () {
      super.groupUsers = value;
    });
  }

  late final _$groupsCounterAtom =
      Atom(name: 'GroupsStoreBase.groupsCounter', context: context);

  @override
  int get groupsCounter {
    _$groupsCounterAtom.reportRead();
    return super.groupsCounter;
  }

  @override
  set groupsCounter(int value) {
    _$groupsCounterAtom.reportWrite(value, super.groupsCounter, () {
      super.groupsCounter = value;
    });
  }

  late final _$deleteGroupAsyncAction =
      AsyncAction('GroupsStoreBase.deleteGroup', context: context);

  @override
  Future<void> deleteGroup({required int groupId}) {
    return _$deleteGroupAsyncAction
        .run(() => super.deleteGroup(groupId: groupId));
  }

  late final _$getGroupsAsyncAction =
      AsyncAction('GroupsStoreBase.getGroups', context: context);

  @override
  Future<void> getGroups() {
    return _$getGroupsAsyncAction.run(() => super.getGroups());
  }

  late final _$getUsersForGroupAsyncAction =
      AsyncAction('GroupsStoreBase.getUsersForGroup', context: context);

  @override
  Future<void> getUsersForGroup({required int groupId}) {
    return _$getUsersForGroupAsyncAction
        .run(() => super.getUsersForGroup(groupId: groupId));
  }

  late final _$addGroupAsyncAction =
      AsyncAction('GroupsStoreBase.addGroup', context: context);

  @override
  Future<void> addGroup({required Map<String, dynamic> groupJson}) {
    return _$addGroupAsyncAction
        .run(() => super.addGroup(groupJson: groupJson));
  }

  late final _$GroupsStoreBaseActionController =
      ActionController(name: 'GroupsStoreBase', context: context);

  @override
  void countUsers() {
    final _$actionInfo = _$GroupsStoreBaseActionController.startAction(
        name: 'GroupsStoreBase.countUsers');
    try {
      return super.countUsers();
    } finally {
      _$GroupsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
groups: ${groups},
groupUsers: ${groupUsers},
groupsCounter: ${groupsCounter}
    ''';
  }
}
