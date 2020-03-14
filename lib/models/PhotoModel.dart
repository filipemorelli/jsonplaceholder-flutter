import 'package:hive/hive.dart';

part 'PhotoModel.g.dart';

@HiveType(typeId: 6)
class PhotoModel extends HiveObject {
  static const String table = "photos";

  @HiveField(0)
  int id;
  @HiveField(1)
  int albumId;
  @HiveField(2)
  String title;
  @HiveField(3)
  String url;
  @HiveField(4)
  String thumbnailUrl;

  PhotoModel({this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  PhotoModel.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.albumId = json['albumId'],
        this.title = json['title'],
        this.url = json['url'],
        this.thumbnailUrl = json['thumbnailUrl'];

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "albumId": this.albumId,
        "title": this.title,
        "url": this.url,
        "thumbnailUrl": this.thumbnailUrl
      };
}
