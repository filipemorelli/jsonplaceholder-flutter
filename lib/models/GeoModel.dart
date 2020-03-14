import 'package:hive/hive.dart';

part 'GeoModel.g.dart';

@HiveType(typeId: 5)
class GeoModel extends HiveObject {
  @HiveField(0)
  String lat;
  @HiveField(1)
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
