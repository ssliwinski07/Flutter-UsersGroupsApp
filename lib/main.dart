import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_users_group_app/models/groups/group_model.dart';

import 'helpers/helpers.dart';
import 'core/core.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceLocator = ServiceLocator();

  Future<void> initServices() async {
    await serviceLocator.initializeCoreServices();
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

  // final user = UserModel(
  //     userName: 'vlad',
  //     lastName: 'smirnofski',
  //     streetName: 'lesna 19',
  //     postalCode: '41-943',
  //     cityName: 'butom');

  // final userToJson = user.toJson();

  //await databaseServiceBase.addUser(userJson: userToJson, groupId: 2);
  //userId: 4, userName: Michal, lastName: Bonk, streetName: lesna 19, postalCode: 41-943, cityName: butom)
  //DSA

  final result5 = await databaseServiceBase.getUsersGroups();

  final result6 = await databaseServiceBase.getUsers();

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

  runApp(MyApp(
    items: result5,
    items2: result6,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.items, required this.items2});

  List<GroupModel> items;
  List<UserModel> items2;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'BE',
        items: items,
        items2: items2,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {super.key,
      required this.title,
      required this.items,
      required this.items2});

  List<GroupModel> items;
  List<UserModel> items2;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  var items = widget.items[index];
                  var group = items.groupName;
                  return Text(group);
                }),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[200],
            child: ListView.builder(
                itemCount: widget.items2.length,
                itemBuilder: (BuildContext context, int index) {
                  var items2 = widget.items2[index];
                  var group = items2.userName;
                  return Text(group);
                }),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
