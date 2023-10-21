import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/add_button_to_favorite.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewSubCategoriesItems extends StatelessWidget {
  const ListViewSubCategoriesItems({
    super.key,
  });
  // final List<ItemModel> list;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: 350,
      child: GetX<HomeController>(
        init: homeController,
        builder: (controller) => ListView.builder(
          // ignore: invalid_use_of_protected_member
          itemCount: controller.itemModelShearch.value.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () =>
                  // ignore: invalid_use_of_protected_member
                  controller.toItem(controller.itemModelShearch.value[index]),
              child: SizedBox(
                width: 300,
                child: Card(
                  elevation: 10,
                  color: ColorManager.whiteDark,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                  elevation: 10,
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            // ignore: invalid_use_of_protected_member
                                            "${Hostting.imageItem}/${controller.itemModelShearch.value[index].images![0]}",
                                        placeholder: (context, url) =>
                                            const ProgressHomeRow(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        height: 200,
                                        width: 250,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  )),
                              Text(
                                // ignore: invalid_use_of_protected_member
                                controller.itemModelShearch.value[index].name,
                                style: FontDef.w600S14Cb,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ignore: invalid_use_of_protected_member
                              AddButtomToFavorite(
                                  item:
                                      // ignore: invalid_use_of_protected_member
                                      controller.itemModelShearch.value[index]),
                              Text(
                                // ignore: invalid_use_of_protected_member
                                controller.itemModelShearch.value[index].price
                                    .toString(),
                                style: FontDef.w600S14Cb,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
