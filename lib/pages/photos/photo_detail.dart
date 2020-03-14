import 'package:flutter/material.dart';
import 'package:jsonplaceholder/globals/functions.dart';
import 'package:jsonplaceholder/models/PhotoModel.dart';
import 'package:photo_view/photo_view.dart';

class PhotoDetail extends StatefulWidget {
  final PhotoModel photoModel;

  PhotoDetail({@required this.photoModel});

  @override
  _PhotoDetailState createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        title: Text(widget.photoModel.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              showToast(scaffoldKey: _scaffoldKey, text: "Não Implementado");
            },
          )
        ],
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(widget.photoModel.url),
        ),
      ),
    );
  }
}
