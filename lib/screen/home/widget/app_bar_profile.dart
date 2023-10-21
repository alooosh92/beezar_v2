import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';

AppBar appBarprofile(BuildContext context) {
  HomeController homeController = Get.find();
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    title: const SizedBox(
      height: 25,
      child: Text("الصفحة الشخصية", style: FontDef.w700182Cb),
    ),
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
        onPressed: () => homeController.cheangePage(0),
        icon: const Icon(Icons.arrow_back_ios_outlined,
            color: ColorManager.grayText),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size(200, 120),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                    "lib/assets/images/person.jpg",
                  )),
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorManager.primaryColor,
                          ColorManager.litePrimaryColor,
                          ColorManager.white
                        ]),
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
    ),
  );
}
