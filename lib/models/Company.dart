class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.catchPhrase = json['catchPhrase'],
        this.bs = json["bs"];

  Map<String, String> toJson() => {
        "name": this.name,
        "catchPhrase": this.catchPhrase,
        "bs": this.bs,
      };
}
