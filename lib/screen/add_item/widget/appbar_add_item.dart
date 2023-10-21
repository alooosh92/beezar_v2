import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarAddItem() {
  return AppBar(
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorManager.black,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text(
      "اضافة اعلان",
      style: FontDef.w700S24Cb,
    ),
  );
}
