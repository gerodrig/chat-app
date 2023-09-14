import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final users = [
    User(email: 'benito@test.com', name: 'Benito', uid: '1', online: true),
    User(email: 'mimi@test.com', name: 'Mimi', uid: '2'),
    User(email: 'emma@test.com', name: 'Emma', uid: '3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                const Text('Benito', style: TextStyle(color: Colors.black87)),
            elevation: 1,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
            actions: <Widget>[
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.check_circle, color: Colors.blue[200]))
            ]),
        body: SmartRefresher(
            controller: _refreshController,
            onRefresh: _loadUsers,
            enablePullUp: true,
            header: WaterDropHeader(
              complete: Icon(Icons.check, color: Colors.blue[200]),
              waterDropColor: Colors.blue[200]!,
            ),
            child: _listViewUsers()));
  }

  ListView _listViewUsers() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => _userListTile(users[i]),
        separatorBuilder: (_, i) => const Divider(),
        itemCount: users.length);
  }

  ListTile _userListTile(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.name.substring(0, 2).toUpperCase()),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: user.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}
