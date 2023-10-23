import 'dart:io';

class AddItem {
  late int? id;
  late String? name;
  late String? des;
  late double? price;
  late int? catId;
  late int? subCatID;
  late String? address;
  late List<File>? images;
  late List<String>? iamgeUri;
  AddItem(
      {this.id,
      this.catId,
      this.des,
      this.images,
      this.name,
      this.price,
      this.subCatID,
      this.address,
      this.iamgeUri});
}
