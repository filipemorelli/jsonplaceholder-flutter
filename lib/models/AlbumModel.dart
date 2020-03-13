import 'package:hive/hive.dart';

part 'AlbumModel.g.dart';

@HiveType(typeId: 2)
class AlbumModel extends HiveObject {
  static const String table = "albums";

  @HiveField(0)
  int id;
  @HiveField(1)
  int userId;
  @HiveField(2)
  String title;

  AlbumModel({this.id, this.userId, this.title});

  AlbumModel.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.userId = json['userId'],
        this.title = json['title'];

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "userId": this.userId,
        "title": this.title,
      };
}
