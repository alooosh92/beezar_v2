import 'package:beezar_v2/res/color_manager.dart';
import 'package:beezar_v2/res/font_def.dart';
import 'package:beezar_v2/screen/item/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommitDef extends StatelessWidget {
  const CommitDef(
      {super.key,
      required this.comment,
      required this.date,
      required this.name,
      required this.itemId,
      required this.id});
  final String comment;
  final String name;
  final DateTime date;
  final int id;
  final int itemId;
  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return InkWell(
      onLongPress: () => Get.dialog(AlertDialog(
        title: const Text("تحزير"),
        content: const Text("هل انت متأكد من حذف المنشور؟"),
        actions: [
          TextButton(
              onPressed: () async {
                var b = await itemController.deleteComment(id, itemId);
                if (b) {
                  Get.back();
                  Get.snackbar("معلومات", "تم حذف التعليق بنجاح",
                      backgroundColor: ColorManager.primaryColor,
                      colorText: ColorManager.white);
                }
              },
              child: const Text(
                "حذف",
                style: FontDef.w500S12Cp,
              )),
          TextButton(
              onPressed: () async {
                Get.back();
              },
              child: const Text(
                "إلغاء",
                style: FontDef.w500S12Cb,
              ))
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment,
            style: FontDef.w400S16Cb,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: FontDef.w400S14Cg,
              ),
              Text(
                date.toString().substring(0, 15),
                style: FontDef.w400S14Cg,
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
