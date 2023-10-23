import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarFav(BuildContext context, String text) {
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    title: Text(text, style: FontDef.w700182Cb),
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
          onPressed: () => Get.to(const HomeScreen()),
          icon: const Icon(Icons.arrow_back_ios_outlined,
              color: ColorManager.grayText)),
    ),
  );
}
