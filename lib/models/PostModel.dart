import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jsonplaceholder/globals/functions.dart';

part 'PostModel.g.dart';

@HiveType(typeId: 7)
class PostModel extends HiveObject {
  static const String table = "posts";

  @HiveField(0)
  int id;
  @HiveField(1)
  int userId;
  @HiveField(2)
  String title;
  @HiveField(3)
  String body;

  PostModel({this.id, this.userId, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.userId = json['userId'],
        this.title = json['title'],
        this.body = json['body'];

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "userId": this.userId,
        "title": this.title,
        "body": this.body
      };

  @override
  Future<void> delete({GlobalKey<ScaffoldState> scaffoldKey}) {
    showToast(scaffoldKey: scaffoldKey, text: "$title removido.");
    // Do DELETE request
    return super.delete();
  }

  @override
  Future<void> save({GlobalKey<ScaffoldState> scaffoldKey}) {
    if (!super.isInBox) {
      showToast(scaffoldKey: scaffoldKey, text: "$title cadastrado.");
      // Do POST requset
    } else {
      showToast(scaffoldKey: scaffoldKey, text: "$title atualizado");
      // Do PUT request
    }
    return super.save();
  }
}
