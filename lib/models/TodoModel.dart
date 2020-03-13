import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jsonplaceholder/globals/functions.dart';

part 'TodoModel.g.dart';

@HiveType(typeId: 8)
class TodoModel extends HiveObject {
  static const String table = "todos";

  @HiveField(0)
  int userId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  bool completed;

  TodoModel({this.userId, this.id, this.title, this.completed});

  TodoModel.fromJson(Map<String, dynamic> json)
      : this.userId = json["userId"],
        this.id = json["id"],
        this.title = json["title"],
        this.completed = json["completed"];

  toJson() => {
        "userId": this.userId,
        "id": this.id,
        "title": this.title,
        "completed": this.completed,
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

  void changeComplete({GlobalKey<ScaffoldState> scaffoldKey}) async {
    completed = !completed;
    await save(scaffoldKey: scaffoldKey);
  }
}
