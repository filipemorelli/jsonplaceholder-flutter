import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jsonplaceholder/bloc/Database.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:jsonplaceholder/globals/constans.dart';
import 'package:jsonplaceholder/globals/styles.dart';
import 'package:jsonplaceholder/models/AlbumModel.dart';
import 'package:jsonplaceholder/models/PhotoModel.dart';
import 'package:jsonplaceholder/widgets/DrawerNavigation.dart';

class PhotosScreen extends StatefulWidget {
  final AlbumModel albumModel;

  PhotosScreen({@required this.albumModel});

  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AlbumModel albumModel = widget.albumModel;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(albumModel.title),
      ),
      body: SafeArea(
        bottom: false,
        child: ValueListenableBuilder<Box<PhotoModel>>(
          valueListenable: DataBaseBloc.instance.boxPhotos.listenable(),
          builder: (ctx, box, widget) {
            var albums =
                box.values.where((p) => p.albumId == albumModel.id).toList();
            if (albums.length == 0) {
              return Center(child: CircularProgressIndicator());
            }

            return Scrollbar(
              child: OrientationBuilder(
                builder: (ctx, orientarion) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: spaceSize),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (orientarion == Orientation.portrait) ? 2 : 3,
                        mainAxisSpacing: spaceSize,
                        crossAxisSpacing: spaceSize,
                      ),
                      itemCount: albums.length,
                      itemBuilder: (ctx, index) {
                        var photo = box.getAt(index);
                        return InkWell(
                          onTap: () {
                            navigatorKey.currentState
                                .pushNamed("photo-detail", arguments: photo);
                          },
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            child: GridTile(
                              footer: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(photo.title),
                              ),
                              child: Hero(
                                tag: photo.title,
                                child: Image.network(photo.thumbnailUrl),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
