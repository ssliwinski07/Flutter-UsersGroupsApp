import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/widgets/widgets.dart';
import 'package:flutter_users_group_app/views/views.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loading();
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
        child: _isLoading ? const LoadingWidget() : const _MainContent(),
      ),
    );
  }

  //fake loading
  Future<void> _loading() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      _isLoading = !_isLoading;
      setState(() {});
    }
  }
}

class _MainContent extends StatefulWidget {
  const _MainContent();

  @override
  State<_MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<_MainContent> {
  @override
  Widget build(BuildContext context) {
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
          onTap: () => context.go(
              Uri(
                      path: usersScreenViewPath,
                      queryParameters: {'title': context.localize.users})
                  .toString(),
              extra: const UsersList()),
          titleFontSize: 19,
        ),
        TileWidget(
          title: context.localize.usersGroups,
          icon: Icons.people,
          iconColor: Colors.black,
          onTap: () {},
          titleFontSize: 19,
        )
      ],
    );
  }
}


// showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),