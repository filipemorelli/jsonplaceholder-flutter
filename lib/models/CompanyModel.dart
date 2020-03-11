class CompanyModel {
  String name;
  String catchPhrase;
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
