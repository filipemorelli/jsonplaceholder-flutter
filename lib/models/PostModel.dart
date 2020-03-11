class PostModel {
  int id;
  int userId;
  String title;
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
