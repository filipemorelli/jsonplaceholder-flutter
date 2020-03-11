import 'package:hive/hive.dart';

part 'PostModel.g.dart';

@HiveType(typeId: 7)
class PostModel extends HiveObject {
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
}
