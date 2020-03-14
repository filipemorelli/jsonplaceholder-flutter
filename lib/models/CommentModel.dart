import 'package:hive/hive.dart';

part 'CommentModel.g.dart';

@HiveType(typeId: 3)
class CommentModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int postId;
  @HiveField(2)
  String name;
  @HiveField(3)
  String email;
  @HiveField(4)
  String body;

  CommentModel({this.id, this.postId, this.name, this.email, this.body});

  CommentModel.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.postId = json['postId'],
        this.name = json['name'],
        this.email = json['email'],
        this.body = json['body'];

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "postId": this.postId,
        "name": this.name,
        "email": this.email,
        "body": this.body
      };
}
