class GeoModel {
  String lat;
  String lng;

  GeoModel({this.lat, this.lng});

  GeoModel.fromJson(Map<String, dynamic> json)
      : this.lat = json['lat'],
        this.lng = json['lng'];

  Map<String, String> toJson() => {
        "lat": this.lat,
        "lng": this.lng,
      };
}
