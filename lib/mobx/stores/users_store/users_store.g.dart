// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsersStore on UsersStoreBase, Store {
  late final _$usersAtom = Atom(name: 'UsersStoreBase.users', context: context);

  @override
  ObservableList<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$usersCounterAtom =
      Atom(name: 'UsersStoreBase.usersCounter', context: context);

  @override
  int get usersCounter {
    _$usersCounterAtom.reportRead();
    return super.usersCounter;
  }

  @override
  set usersCounter(int value) {
    _$usersCounterAtom.reportWrite(value, super.usersCounter, () {
      super.usersCounter = value;
    });
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('UsersStoreBase.deleteUser', context: context);

  @override
  Future<void> deleteUser({required int userId}) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(userId: userId));
  }

  late final _$getUsersAsyncAction =
      AsyncAction('UsersStoreBase.getUsers', context: context);

  @override
  Future<void> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  late final _$UsersStoreBaseActionController =
      ActionController(name: 'UsersStoreBase', context: context);

  @override
  void countUsers() {
    final _$actionInfo = _$UsersStoreBaseActionController.startAction(
        name: 'UsersStoreBase.countUsers');
    try {
      return super.countUsers();
    } finally {
      _$UsersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
usersCounter: ${usersCounter}
    ''';
  }
}
