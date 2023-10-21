import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> infoDialog(String discreption) {
  return Get.dialog(
    AlertDialog(
      backgroundColor: ColorManager.primaryColor,
      elevation: 3,
      insetPadding: const EdgeInsets.all(30),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "تفاصيل",
            style: FontDef.w700S24Cw,
          ),
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.close,
                color: ColorManager.white,
              ))
        ],
      ),
      content: Text(
        discreption,
        style: FontDef.w700S16Cw,
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ColorManager.white)),
          child: const Text(
            "موافق",
            style: FontDef.w600S17Cb,
          ),
        )
      ],
    ),
  );
}
