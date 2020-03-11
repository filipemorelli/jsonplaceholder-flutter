import 'package:jsonplaceholder/models/AdressModel.dart';
import 'package:jsonplaceholder/models/CompanyModel.dart';

class UserModel {
  int id;
  String name;
  String email;
  AddressModel address;
  String phone;
  String website;
  CompanyModel company;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.email = json['email'],
        this.address = AddressModel.fromJson(json['address']),
        this.phone = json['phone'],
        this.website = json['website'],
        this.company = CompanyModel.fromJson(json['company']);

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
