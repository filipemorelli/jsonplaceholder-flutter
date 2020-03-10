import 'package:flutter/material.dart';
import 'package:jsonplaceholder/globals/styles.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Found"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: spaceSize),
        child: Center(
          child: Text("Not Found"),
        ),
      ),
    );
  }
}
