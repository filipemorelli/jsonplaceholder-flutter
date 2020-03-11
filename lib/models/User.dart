import 'package:jsonplaceholder/models/Adress.dart';
import 'package:jsonplaceholder/models/Company.dart';

class User {
  int id;
  String name;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  User.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.email = json['email'],
        this.address = Address.fromJson(json['address']),
        this.phone = json['phone'],
        this.website = json['website'],
        this.company = Company.fromJson(json['company']);

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'email': this.email,
        'address': this.address.toJson(),
        'phone': this.phone,
        'website': this.website,
        'company': this.company.toJson(),
      };
}
