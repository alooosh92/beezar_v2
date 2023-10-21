class ItemModel {
  late int id;
  late String name;
  late String username;
  late String description;
  late double price;
  late String address;
  late String phone;
  late int? categoryId;
  late int? subCategoryId;
  late List<String>? images;
  late bool favorite;

  ItemModel(
      {required this.address,
      required this.categoryId,
      required this.description,
      required this.id,
      required this.images,
      required this.name,
      required this.phone,
      required this.price,
      required this.subCategoryId,
      required this.username,
      required this.favorite});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    List<String> imas = [];
    for (var element in json["images"]) {
      imas.add(element["name"]);
    }
    return ItemModel(
      address: json["address"],
      categoryId: json["category_id"],
      description: json["description"],
      id: json["id"],
      images: imas,
      name: json["name"],
      username: json["name_user"],
      phone: json["number_user"],
      price: double.parse(json["price"].toString()),
      subCategoryId: json["sub_category_id"],
      favorite: false,
    );
  }
}
