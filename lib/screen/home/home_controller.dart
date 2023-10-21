import 'dart:convert';
import 'package:beezer_v2/model/gategory_model.dart';
import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/model/sub_gategory_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxInt categore = (-1).obs;
  RxInt subCategory = (-1).obs;
  RxString region = "".obs;
  RxList<GategoryModel> listGategoryModel = RxList<GategoryModel>();
  RxMap<String, List<SubCategoryModel>> listSubCategory =
      RxMap<String, List<SubCategoryModel>>();
  RxList<ItemModel> itemModelAll = RxList<ItemModel>();
  RxList<ItemModel> itemModelShearch = RxList<ItemModel>();
  PageController pageController = PageController();
  RxList<String> listDropDownSearch = RxList<String>();
  RxInt pageNumber = 0.obs;

  @override
  void onInit() async {
    await getCategoryAndSub();
    super.onInit();
  }

  void changeRegion(String val) {
    region.value = val;
  }

  void cheangePage(int number) {
    pageNumber.value = number;
    pageController.jumpToPage(number);
  }

  void cheangeCategory(int? num) {
    if (categore.value != -1 && categore.value == num) {
      categore.value = -1;
    } else {
      categore.value = num!;
    }
    subCategory.value = -1;
    searchItem();
    refresh();
  }

  void cheangeSubCategory(int? sub) {
    subCategory.value = sub!;
    searchItem();
  }

  void toItem(ItemModel itemModel) {
    Get.to(ItemScreen(item: itemModel));
  }

  void searchItem() {
    // ignore: invalid_use_of_protected_member
    itemModelShearch.value = itemModelAll.value;
    if (region.value != "") {
      itemModelShearch.value = itemModelAll
          .where((element) => element.address == region.value)
          .toList();
    }
    if (categore.value != -1) {
      itemModelShearch.value = itemModelShearch
          .where((element) => element.categoryId == categore.value)
          .toList();
    }
    if (subCategory.value != -1) {
      itemModelShearch.value = itemModelShearch
          .where((element) => element.subCategoryId == subCategory.value)
          .toList();
    }
    itemModelShearch.refresh();
    subCategory.refresh();
    categore.refresh();
  }

  Future<List<ItemModel>> getMyItem() async {
    http.Response response =
        await http.get(Hostting.getMyItem, headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      List<ItemModel> list = [];
      var body = jsonDecode(response.body);
      for (var element in body["items"]) {
        list.add(ItemModel.fromJson(element));
      }
      return list;
    }
    return List.empty();
  }

  Future<List<SubCategoryModel>> getSubCategory(int num) async {
    List<SubCategoryModel> listSub = [];
    http.Response responseSub = await http.get(Hostting.getSubCategory(num),
        headers: Hostting().getHeader());
    if (responseSub.statusCode == 200) {
      var bodySub = jsonDecode(responseSub.body);
      listSub.add(
          SubCategoryModel(iamge: null, id: -1, name: "الكل", categoryId: num));
      for (var element in bodySub["subcategories"]) {
        var sub = SubCategoryModel.fromJson(element);
        listSub.add(sub);
      }
    }
    return listSub;
  }

  Future<List<GategoryModel>> getCategoryAndSub() async {
    if (listGategoryModel.isEmpty) {
      http.Response response =
          await http.get(Hostting.getCategory, headers: Hostting().getHeader());
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        for (var element in body["categories"]) {
          var gate = GategoryModel.fromJson(element);
          listGategoryModel.add(gate);
          var sub = await getSubCategory(gate.id);
          listSubCategory.addIf(
            !listSubCategory.containsKey(gate.name),
            gate.name,
            sub,
          );
        }
      }
    }
    return listGategoryModel;
  }

  Future<List<ItemModel>> getFavourite(ItemModel? itemModel) async {
    if (itemModelAll.isNotEmpty) {
      if (itemModel == null) {
        http.Response response = await http.post(Hostting.getFavourite,
            headers: Hostting().getHeader());
        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);
          if (body["favorite_items"] != null) {
            for (var element in body["favorite_items"]) {
              var it = itemModelAll
                  .where((item) => item.id == ItemModel.fromJson(element).id)
                  .firstOrNull;
              if (it != null) {
                var i = itemModelAll.indexOf(it);
                itemModelAll[i].favorite = true;
              }
            }
          }
        }
      } else {
        var i = itemModelAll.indexOf(itemModel);
        itemModelAll[i].favorite = !itemModelAll[i].favorite;
      }
    }
    return itemModelAll.where((element) => element.favorite).toList();
  }

  Future<List<ItemModel>> getAllItems(bool updateData) async {
    if (itemModelAll.isEmpty || updateData) {
      http.Response response =
          await http.get(Hostting.getItems, headers: Hostting().getHeader());
      if (response.statusCode == 200) {
        List<ItemModel> list = [];
        var body = jsonDecode(response.body);
        for (var element in body["items"]) {
          var it = ItemModel.fromJson(element);
          itemModelAll.add(it);
          itemModelShearch.add(it);
          listDropDownSearch.add("${it.id} - ${it.name}");
        }
        await getFavourite(null);
        refresh();
        return list;
      }
    }
    return itemModelShearch;
  }

  Future<bool> addDeleteFavourite(ItemModel item) async {
    http.Response response = await http.post(
        Hostting.addDeleteFavourite(item.id),
        headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      var i = itemModelAll.indexOf(item);
      itemModelAll[i].favorite = !itemModelAll[i].favorite;
      itemModelShearch.refresh();
      itemModelAll.refresh();
      return true;
    }
    return false;
  }

  void buildListSearch() {
    for (var element in itemModelAll) {
      listDropDownSearch.add("${element.id} - الاسم:${element.name}");
    }
    refresh();
  }
}
