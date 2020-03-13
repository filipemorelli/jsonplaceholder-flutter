import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jsonplaceholder/bloc/Database.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:jsonplaceholder/globals/constans.dart';
import 'package:jsonplaceholder/models/AlbumModel.dart';
import 'package:jsonplaceholder/widgets/DrawerNavigation.dart';

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Albums"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder<Box<AlbumModel>>(
          valueListenable: DataBaseBloc.instance.boxAlbum.listenable(),
          builder: (ctx, box, widget) {
            var albums = box.values
                .where((a) => a.userId == UserBloc.instance.userSelected.id)
                .toList();
            if (albums.length == 0) {
              return Center(child: CircularProgressIndicator());
            }

            return Scrollbar(
              child: ListView.builder(
                itemCount: albums.length,
                itemBuilder: (ctx, index) {
                  var album = box.getAt(index);
                  return ListTile(
                    title: Text(album.title),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      navigatorKey.currentState
                          .pushNamed("photos", arguments: album);
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: DrawerNavigation(),
    );
  }
}
