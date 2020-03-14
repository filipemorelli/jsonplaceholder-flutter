import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jsonplaceholder/bloc/Database.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:jsonplaceholder/globals/styles.dart';
import 'package:jsonplaceholder/models/PostModel.dart';
import 'package:jsonplaceholder/widgets/DrawerNavigation.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Posts"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(
            milliseconds: 1500,
          ));
          return Future.value(null);
        },
        child: SafeArea(
          bottom: false,
          child: ValueListenableBuilder<Box<PostModel>>(
            valueListenable: DataBaseBloc.instance.boxPosts.listenable(),
            builder: (ctx, box, widget) {
              var posts = box.values
                  .where((p) => p.userId == UserBloc.instance.userSelected.id)
                  .toList();
              if (posts.length == 0) {
                return Center(child: CircularProgressIndicator());
              }

              return Scrollbar(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (ctx, index) {
                    var post = box.getAt(index);
                    return Card(
                      margin: EdgeInsets.all(spaceSize),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              margin: EdgeInsets.symmetric(vertical: spaceSize),
                              child: Text(
                                post.title,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            subtitle: Text(
                              post.body,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.thumb_up),
                                label: Text("Like"),
                              ),
                              FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.comment),
                                label: Text("Comments"),
                              ),
                              FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.share),
                                label: Text("Share"),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: DrawerNavigation(),
    );
  }
}
