class Post {
  int id;
  int userId;
  String title;
  String body;

  Post({this.id, this.userId, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json)
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
