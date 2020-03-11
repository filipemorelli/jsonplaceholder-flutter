class CommentModel {
  int id;
  int postId;
  String name;
  String email;
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
