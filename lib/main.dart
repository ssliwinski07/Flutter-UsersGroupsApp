import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'helpers/helpers.dart';
import 'core/core.dart';
import 'mobx/stores/stores.dart';
import 'routes/routes.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceLocator = ServiceLocator();

  Future<void> initServices() async {
    await serviceLocator.initializeCoreServices();
    await serviceLocator.initializeUiServices();
  }

  await initServices();

  DatabaseServiceBase databaseServiceBase = serviceLocator
      .getInstance<DatabaseServiceBase>(instanceName: mainInstance);

  await databaseServiceBase.initilizeDatabase();

  //// Custom query to get list od groups with users or list of users with their group ////

  // const queryForUsersAndGroups = ''' SELECT
  // $usersTable.userId,
  // $usersTable.userName,
  // $usersTable.lastName,
  // $usersTable.streetName,
  // $usersTable.postalCode,
  // $usersTable.cityName,
  // $groupsTable.groupId,
  // $groupsTable.groupName
  // FROM $usersTable
  // JOIN $usersGroupsTable ON $usersGroupsTable.userId = $usersTable.userId
  // JOIN $groupsTable ON $groupsTable.groupId = $usersGroupsTable.groupId
  //  ''';

  //await databaseServiceBase.deleteGroup(groupId: 2);
  //// GETTINGS USERS GROUPS ////
  ///

  final user = UserModel(
      userName: 'MICHAL',
      lastName: 'KostKowski',
      streetName: 'Chorzowska 214/83',
      postalCode: '40-101',
      cityName: 'Katowice');

  final group = GroupModel(groupName: 'testowa');

  //await databaseServiceBase.addUser(userJson: user.toJson(), groupId: 2);

  //userId: 4, userName: Michal, lastName: Bonk, streetName: lesna 19, postalCode: 41-943, cityName: butom)
  //DSA

  //final result2 = await databaseServiceBase.getUsersGroups();

  //print(result2);

  // List<String> listOfUsers = [];

  // for (GroupWithUsersModel item in result) {
  //   List<UserModel> users = item.users;
  //   String groupName = item.group.groupName;
  //   if (groupName == 'Administrators') {
  //     List<String> elements = users.map((e) => e.userName).toList();

  //     String element = elements.join(', ');

  //     listOfUsers.add(element);
  //   }
  // }

  //print('List of users in admin group: ${listOfUsers.join(', ')}');

  //// Displaying users, groups and users_groups data in json format ////

  // final users = await databaseServiceBase.getDataFromTable(
  //   table: usersTable,
  //   fromJson: (e) => UserModel.fromJson(e),
  // );
  // final groups = await databaseServiceBase.getDataFromTable(
  //   table: groupsTable,
  //   fromJson: (e) => GroupModel.fromJson(e),
  // );
  // final usersGroups = await databaseServiceBase.getDataFromTable(
  //   table: usersGroupsTable,
  //   fromJson: (e) => UserGroupModel.fromJson(e),
  // );

  // final usersToJsonList = [];
  // final groupsToJson = [];
  // final usersGroupsToJson = [];

  // for (UserModel user in users) {
  //   usersToJsonList.add(JsonEncoder.withIndent('  ').convert(user.toJson()));
  // }

  // for (GroupModel group in groups) {
  //   groupsToJson.add(JsonEncoder.withIndent('  ').convert(group.toJson()));
  // }

  // for (UserGroupModel userGroup in usersGroups) {
  //   usersGroupsToJson
  //       .add(JsonEncoder.withIndent('  ').convert(userGroup.toJson()));
  // }

  // print(usersToJsonList);
  // print(groupsToJson);
  // print(usersGroupsToJson);

  //// Mocking data and adding it to database ////

  // final user = UserModel(
  //   userName: 'Szymon',
  //   lastName: 'Sliwinski',
  //   streetName: 'Chorzowska 214/83',
  //   postalCode: '41-101',
  //   cityName: 'Katowice',
  // );
  // final user2 = UserModel(
  //   userName: 'Gosia',
  //   lastName: 'Sliwinski',
  //   streetName: 'Chorzowska 214/83',
  //   postalCode: '41-101',
  //   cityName: 'Katowice',
  // );
  // final user3 = UserModel(
  //   userName: 'Frania',
  //   lastName: 'Sliwinski',
  //   streetName: 'Chorzowska 214/83',
  //   postalCode: '41-101',
  //   cityName: 'Katowice',
  // );

  // final userToJson = user.toJson();
  // final user2ToJson = user2.toJson();
  // final user3ToJson = user3.toJson();

  // final group = GroupModel(groupName: 'Administrators');
  // final group2 = GroupModel(groupName: 'Guests');

  // final groupToJson = group.toJson();
  // final group2ToJson = group2.toJson();

  // final userId = await databaseServiceBase.insertToDatabase(
  //     json: userToJson, tableName: usersTable);
  // print('ID usera user: $userId');
  // final userId2 = await databaseServiceBase.insertToDatabase(
  //     json: user2ToJson, tableName: usersTable);
  // print('ID usera user2: $userId2');
  // final userId3 = await databaseServiceBase.insertToDatabase(
  //     json: user3ToJson, tableName: usersTable);
  // print('ID usera user2: $userId3');

  // final groupId = await databaseServiceBase.insertToDatabase(
  //     tableName: groupsTable, json: groupToJson);
  // print('ID grupy administrator: $groupId');
  // final groupId2 = await databaseServiceBase.insertToDatabase(
  //     tableName: groupsTable, json: group2ToJson);
  // print('ID grupy administrator: $groupId2');

  // final userGroup = UserGroupModel(userId: userId, groupId: groupId);
  // final userGroup2 = UserGroupModel(userId: userId2, groupId: groupId2);
  // final userGroup3 = UserGroupModel(userId: userId3, groupId: groupId);

  // final userGroupToJson = userGroup.toJson();
  // final userGroupToJson2 = userGroup2.toJson();
  // final userGroupToJson3 = userGroup3.toJson();

  // await databaseServiceBase.insertToDatabase(
  //     json: userGroupToJson, tableName: usersGroupsTable);
  // await databaseServiceBase.insertToDatabase(
  //     json: userGroupToJson2, tableName: usersGroupsTable);
  // await databaseServiceBase.insertToDatabase(
  //     json: userGroupToJson3, tableName: usersGroupsTable);

  runApp(
    MultiProvider(
      providers: [
        Provider<UsersStore>(
          create: (context) => UsersStore(databaseService: databaseServiceBase),
        ),
        Provider<GroupsStore>(
          create: (context) =>
              GroupsStore(databaseService: databaseServiceBase),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.router,
      locale: const Locale('en'),
    );
  }
}
