class PoliceModel {
  late int id;
  late String title;
  late List<String> policies;

  PoliceModel({required this.id, required this.policies, required this.title});

  factory PoliceModel.fromJson(Map<String, dynamic> json) {
    List<String> list = [];
    for (var element in json["policies"]) {
      list.add(element["text"]);
    }
    return PoliceModel(
      id: json["id"],
      policies: list,
      title: json["title"],
    );
  }
}
