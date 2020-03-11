class Photo {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Photo({this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json)
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
