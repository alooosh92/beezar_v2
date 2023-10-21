import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> imageDialog(
    BuildContext context, ItemController itemController, List<String> images) {
  return Get.dialog(
      SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height - 150,
        child: PageView.builder(
          controller: itemController.pageController,
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: "${Hostting.imageItem}/${images[index]}",
              placeholder: (context, url) => const ProgressHomeRow(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
        ),
      ),
      transitionCurve: Curves.easeInCirc,
      barrierColor: ColorManager.primaryColor);
}
