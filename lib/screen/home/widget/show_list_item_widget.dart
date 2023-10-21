import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/item_in_favorite.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:beezer_v2/screen/update_Item/update_item.dart';
import 'package:beezer_v2/widget/cottact_with_user.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowListItemWidget extends StatelessWidget {
  const ShowListItemWidget(
      {super.key, required this.list, required this.isFavorite});

  final List<ItemModel> list;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    if (list.isEmpty) {
      return const Center(
        child: Text(
          "لا يوجد عناصر لعرضها",
          style: FontDef.w400S16Cb,
        ),
      );
    }
    return ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ItemInFavorite(
          isfav: isFavorite,
          item: list[index],
          pressItem: () => Get.to(ItemScreen(item: list[index])),
          pressContact: () => isFavorite
              ? conttactWithUser(list[index].phone)
              : Get.to(const UpdateItemScreen()),
          pressDelete: () async {
            //
            //حذف منشور
            //
            progressDef();
            var b = await homeController.addDeleteFavourite(list[index]);
            if (b) {
              Get.back();
              Get.snackbar(
                  backgroundColor: ColorManager.primaryColor,
                  colorText: ColorManager.white,
                  "ملاحظة",
                  list[index].favorite
                      ? "تم اضافة الاعلان الى المفضلة"
                      : "تم حذف الاعلان من المفضلة");
            } else {
              Get.back();
              Get.snackbar("خطأ", "حدث خطأ ما الرجاء التواصل مع المسؤول");
            }
          },
        );
      },
    );
  }
}
