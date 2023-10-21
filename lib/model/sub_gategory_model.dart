class SubCategoryModel {
  late int id;
  late String name;
  late String? iamge;
  late int categoryId;

  SubCategoryModel(
      {required this.iamge,
      required this.id,
      required this.name,
      required this.categoryId});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      iamge: json["iamge"],
      id: json["id"],
      name: json["name"],
      categoryId: json["category_id"],
    );
  }
}
