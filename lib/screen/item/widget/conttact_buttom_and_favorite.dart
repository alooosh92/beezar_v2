import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/widget/cottact_with_user.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConttactButtomAndFavorite extends StatefulWidget {
  const ConttactButtomAndFavorite({super.key, required this.item});
  final ItemModel item;

  @override
  State<ConttactButtomAndFavorite> createState() =>
      _ConttactButtomAndFavoriteState();
}

class _ConttactButtomAndFavoriteState extends State<ConttactButtomAndFavorite> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    var fav = homeController.itemModelAll
        .where((p0) => p0.id == widget.item.id)
        .first
        .favorite;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () => conttactWithUser(widget.item.phone),
            style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(5),
                fixedSize: MaterialStatePropertyAll(Size(250, 50)),
                backgroundColor:
                    MaterialStatePropertyAll(ColorManager.primaryColor)),
            child: const Text("إجراء اتصال", style: FontDef.w600S20Cw),
          ),
          ElevatedButton(
            onPressed: () async {
              progressDef();
              HomeController homeController = Get.find();
              var b = await homeController.addDeleteFavourite(widget.item);
              if (b) {
                Get.back();
                Get.snackbar(
                    backgroundColor: ColorManager.primaryColor,
                    colorText: ColorManager.white,
                    "ملاحظة",
                    !fav
                        ? "تم اضافة الاعلان الى المفضلة"
                        : "تم حذف الاعلان من المفضلة");
                setState(() {});
              } else {
                Get.back();
              }
            },
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(ColorManager.liteGrayText),
              fixedSize: MaterialStatePropertyAll(Size(50, 50)),
              elevation: MaterialStatePropertyAll(5),
            ),
            child: Icon(fav ? Icons.favorite : Icons.favorite_border_outlined,
                size: 35, color: ColorManager.primaryColor),
          )
        ],
      ),
    );
  }
}
