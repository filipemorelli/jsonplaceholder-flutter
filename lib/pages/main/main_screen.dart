import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:jsonplaceholder/globals/constans.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showNotImplementedMessage() {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
      content: Text("The drawer's items don't do anything"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text("Main"),
      ),
      body: SafeArea(
        child: Center(
          child: Text("JSONPlaceholder"),
        ),
      ),
      drawer: Drawer(
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
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.photo_album),
                      title: Text("Albuns"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text("Posts"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Sair"),
                      onTap: () => navigatorKey.currentState..pop()..pop(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
