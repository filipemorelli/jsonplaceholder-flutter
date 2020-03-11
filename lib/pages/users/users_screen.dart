import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jsonplaceholder/models/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> users;
  Future<bool> initDbFuture;
  Box<UserModel> boxUser;

  @override
  void initState() {
    super.initState();
    this.initDbFuture = initDb();
  }

  Future<bool> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final hiveFolder = join(dir.path, "hive");
    Hive.init(hiveFolder);
    try {
      Hive.registerAdapter(UserModelAdapter());
    } on HiveError catch (e) {
      print(e);
    }
    if (boxUser == null) {
      boxUser = await Hive.openBox<UserModel>("users");
    }
    this.users = boxUser.values.toList();
    print("Load users");
    this.users.forEach(
        (user) => dev.log(user.toJson().toString(), name: "UserScreen"));
    return true;
  }

  @override
  void dispose() {
    Hive.box("users").compact();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: SafeArea(
        child: FutureBuilder<bool>(
          future: initDbFuture,
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Text("users"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // UserModel u = new UserModel(
          //     id: 1, name: "Filipe ${Random().nextInt(100).toString()}");
          // boxUser.add(u);
          this.users.forEach((user) async => await user.delete());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
