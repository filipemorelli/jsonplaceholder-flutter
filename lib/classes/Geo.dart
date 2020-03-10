class Geo {
  String lat;
  String lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json)
      : this.lat = json['lat'],
        this.lng = json['lng'];

  Map<String, String> toJson() => {
        "lat": this.lat,
        "lng": this.lng,
      };
}
