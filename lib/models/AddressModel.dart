import 'package:hive/hive.dart';
import 'package:jsonplaceholder/models/GeoModel.dart';

part 'AddressModel.g.dart';

@HiveType(typeId: 1)
class AddressModel extends HiveObject {
  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(4)
  GeoModel geo;

  AddressModel({this.street, this.suite, this.city, this.zipcode, this.geo});

  AddressModel.fromJson(Map<String, dynamic> json)
      : this.street = json['street'],
        this.suite = json['suite'],
        this.city = json["city"],
        this.zipcode = json["zipcode"],
        this.geo = GeoModel.fromJson(json["geo"]);

  Map<String, dynamic> toJson() => {
        "street": this.street,
        "suite": this.suite,
        "city": this.city,
        "zipcode": this.zipcode,
        "geo": this.geo.toJson(),
      };
}
