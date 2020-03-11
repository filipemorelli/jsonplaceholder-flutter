import 'package:hive/hive.dart';
import 'package:jsonplaceholder/models/AdressModel.dart';
import 'package:jsonplaceholder/models/CompanyModel.dart';

part 'UserModel.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  AddressModel address;
  @HiveField(4)
  String phone;
  @HiveField(5)
  String website;
  @HiveField(6)
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
        'address': this.address != null ? this.address.toJson() : {},
        'phone': this.phone,
        'website': this.website,
        'company': this.company != null ? this.company.toJson() : {},
      };
}
