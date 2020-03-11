import 'package:jsonplaceholder/classes/Geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json)
      : this.street = json['street'],
        this.suite = json['suite'],
        this.city = json["city"],
        this.zipcode = json["zipcode"],
        this.geo = Geo.fromJson(json["geo"]);

  Map<String, dynamic> toJson() => {
        "street": this.street,
        "suite": this.suite,
        "city": this.city,
        "zipcode": this.zipcode,
        "geo": this.geo.toJson(),
      };
}
