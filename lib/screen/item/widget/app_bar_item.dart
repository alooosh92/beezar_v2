import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarItem() {
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back,
        color: ColorManager.black,
      ),
    ),
    title: Image.asset("lib/assets/images/logoo 1.png",
        width: 50, height: 50, fit: BoxFit.fill),
  );
}
