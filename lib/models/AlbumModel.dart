class AlbumModel {
  int id;
  int userId;
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
