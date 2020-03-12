import 'package:flutter/material.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:jsonplaceholder/globals/constans.dart';
import 'package:jsonplaceholder/globals/functions.dart';
import 'package:jsonplaceholder/models/UserModel.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      UserBloc.instance.loadUsers().catchError((e) {
        showToast(scaffoldKey: _scaffoldKey, text: e.toString());
      });
    });
  }

  @override
  void dispose() {
    UserBloc.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Escolha um usuário"),
      ),
      body: SafeArea(
        child: StreamBuilder<List<UserModel>>(
          stream: UserBloc.instance.streamUsersModel,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Scrollbar(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, i) {
                  UserModel userModel = snapshot.data[i];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(userModel.id.toString()),
                    ),
                    title: Text(userModel.name),
                    subtitle: Text(userModel.email + "\n" + userModel.phone),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      UserBloc.instance.userSelected = userModel;
                      navigatorKey.currentState.pushNamed("main");
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
