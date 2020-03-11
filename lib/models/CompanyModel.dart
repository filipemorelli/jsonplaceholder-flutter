import 'package:hive/hive.dart';

part 'CompanyModel.g.dart';

@HiveType(typeId: 4)
class CompanyModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
  String bs;

  CompanyModel({this.name, this.catchPhrase, this.bs});

  CompanyModel.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.catchPhrase = json['catchPhrase'],
        this.bs = json["bs"];

  Map<String, String> toJson() => {
        "name": this.name,
        "catchPhrase": this.catchPhrase,
        "bs": this.bs,
      };
}
