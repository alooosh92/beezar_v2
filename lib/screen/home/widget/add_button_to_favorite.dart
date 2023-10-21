import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButtomToFavorite extends StatelessWidget {
  const AddButtomToFavorite({
    super.key,
    required this.item,
  });
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        progressDef();
        HomeController homeController = Get.find();
        var b = await homeController.addDeleteFavourite(item);
        if (b) {
          Get.back();
          Get.snackbar(
              backgroundColor: ColorManager.primaryColor,
              colorText: ColorManager.white,
              "ملاحظة",
              item.favorite
                  ? "تم اضافة الاعلان الى المفضلة"
                  : "تم حذف الاعلان من المفضلة");
        } else {
          Get.back();
        }
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 40,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: ColorManager.primaryColor,
              ),
              child: Center(
                child: Icon(
                  item.favorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  size: 30,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
