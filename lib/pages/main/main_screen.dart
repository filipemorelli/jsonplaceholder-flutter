import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:jsonplaceholder/globals/constans.dart';
import 'package:jsonplaceholder/widgets/DrawerNavigation.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: DrawerNavigation(),
    );
  }
}
