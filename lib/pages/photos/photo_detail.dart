import 'package:flutter/material.dart';
import 'package:jsonplaceholder/models/PhotoModel.dart';
import 'package:photo_view/photo_view.dart';

class PhotoDetail extends StatefulWidget {
  final PhotoModel photoModel;

  PhotoDetail({@required this.photoModel});

  @override
  _PhotoDetailState createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        title: Text(widget.photoModel.title),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(widget.photoModel.url),
        ),
      ),
    );
  }
}
