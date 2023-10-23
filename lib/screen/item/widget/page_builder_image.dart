import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/screen/item/widget/image_dialog.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBuilderImage extends StatelessWidget {
  const PageBuilderImage({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 2.5,
      child: PageView.builder(
        onPageChanged: (value) {
          itemController.changeimage(value);
        },
        controller: itemController.pageController,
        scrollDirection: Axis.horizontal,
        padEnds: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => imageDialog(context, itemController, images),
              child: CachedNetworkImage(
                imageUrl: "${Hostting.imageItem}/${images[index]}",
                placeholder: (context, url) => const ProgressHomeRow(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ));
        },
      ),
    );
  }
}
