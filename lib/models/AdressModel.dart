import 'package:jsonplaceholder/models/GeoModel.dart';

class AddressModel {
  String street;
  String suite;
  String city;
  String zipcode;
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
