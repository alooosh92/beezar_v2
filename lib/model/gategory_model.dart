class GategoryModel {
  late int id;
  late String name;
  late String image;

  GategoryModel({required this.id, required this.image, required this.name});

  factory GategoryModel.fromJson(Map<String, dynamic> json) {
    return GategoryModel(
      id: json["id"],
      image: json["image"],
      name: json["name"],
    );
  }
}
