import 'package:beezer_v2/model/add_item.dart';
import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/add_item/add_item_controller.dart';
import 'package:beezer_v2/screen/add_item/add_item_screen.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/item_in_favorite.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:beezer_v2/widget/cottact_with_user.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowListItemWidget extends StatefulWidget {
  const ShowListItemWidget({
    super.key,
    this.list,
    required this.isFavorite,
  });

  final List<ItemModel>? list;
  final bool isFavorite;

  @override
  State<ShowListItemWidget> createState() => _ShowListItemWidgetState();
}

class _ShowListItemWidgetState extends State<ShowListItemWidget> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    var lists = widget.list ??
        homeController.itemModelAll
            .where((element) => element.favorite)
            .toList();
    if (lists.isEmpty) {
      return const Center(
        child: Text(
          "لا يوجد عناصر لعرضها",
          style: FontDef.w400S16Cb,
        ),
      );
    }
    return ListView.builder(
      itemCount: lists.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ItemInFavorite(
          isfav: widget.isFavorite,
          item: lists[index],
          pressItem: () => Get.to(ItemScreen(item: lists[index])),
          pressContact: () => widget.isFavorite
              ? conttactWithUser(lists[index].phone)
              : Get.to(AddItemScreen(
                  item: AddItem(
                      address: lists[index].address,
                      catId: lists[index].categoryId,
                      des: lists[index].description,
                      id: lists[index].id,
                      name: lists[index].name,
                      price: lists[index].price,
                      iamgeUri: lists[index].images,
                      subCatID: lists[index].subCategoryId),
                )),
          pressDelete: () async {
            if (widget.isFavorite) {
              progressDef();
              var b = await homeController.addDeleteFavourite(lists[index]);
              if (b) {
                Get.back();
                Get.snackbar(
                    backgroundColor: ColorManager.primaryColor,
                    colorText: ColorManager.white,
                    "ملاحظة",
                    lists[index].favorite
                        ? "تم اضافة الاعلان الى المفضلة"
                        : "تم حذف الاعلان من المفضلة");
                setState(() {});
              } else {
                Get.back();
                Get.snackbar("خطأ", "حدث خطأ ما الرجاء التواصل مع المسؤول");
              }
            } else {
              AddItemController addItemController = Get.find();
              Get.dialog(AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () async {
                        progressDef();
                        var b =
                            await addItemController.deleteItem(lists[index].id);
                        if (b) {
                          Get.back();
                          Get.back();
                          Get.snackbar("معلومات", "تم حذف الاعلان بنجاح",
                              backgroundColor: ColorManager.primaryColor,
                              colorText: ColorManager.white);
                          setState(() {
                            lists.remove(lists[index]);
                          });
                        } else {
                          Get.back();
                          Get.back();
                          Get.snackbar(
                              "خطأ", "حدث خطأ ما الرجاء الاتصال بالمسؤول",
                              backgroundColor: ColorManager.primaryColor,
                              colorText: ColorManager.white);
                        }
                      },
                      child: const Text("حذف")),
                  TextButton(
                      onPressed: () => Get.back(), child: const Text("إلغاء"))
                ],
                content: const Text("هل انت متأكد من حذف الاعلان؟"),
                title: const Text("تنبيه"),
              ));
            }
          },
        );
      },
    );
  }
}
