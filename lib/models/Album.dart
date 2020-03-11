class Album {
  int id;
  int userId;
  String title;

  Album({this.id, this.userId, this.title});

  Album.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.userId = json['userId'],
        this.title = json['title'];

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "userId": this.userId,
        "title": this.title,
      };
}
