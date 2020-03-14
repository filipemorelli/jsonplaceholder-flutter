import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:jsonplaceholder/globals/constans.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(UserBloc.instance.userSelected.name),
            accountEmail: Text(UserBloc.instance.userSelected.email),
            currentAccountPicture: CircleAvatar(
              child: Text(UserBloc.instance.userSelected.name[0]),
            ),
            margin: EdgeInsets.zero,
          ),
          MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: true,
            child: Expanded(
              child: ListView(
                dragStartBehavior: DragStartBehavior.down,
                padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title: Text("Todos"),
                    onTap: () {
                      navigatorKey.currentState.pop();
                      navigatorKey.currentState.pushNamed("todos");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text("Albuns"),
                    onTap: () {
                      navigatorKey.currentState.pop();
                      navigatorKey.currentState.pushNamed("albums");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text("Posts"),
                    onTap: () {
                      navigatorKey.currentState.pop();
                      navigatorKey.currentState.pushNamed("posts");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Sair"),
                    onTap: () => navigatorKey.currentState
                        .popUntil((route) => route.isFirst),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
