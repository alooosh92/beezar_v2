import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/screen/item/widget/image_dialog.dart';
import 'package:beezer_v2/widget/app_bar_auth.dart';
import 'package:beezer_v2/widget/change_date_to_day.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAllItem extends StatelessWidget {
  const ShowAllItem({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    ItemController itemController = Get.find();
    return Scaffold(
      appBar: appBarAuth(() => Get.back(), "الإعلانات", context),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: homeController.getAllItems(true),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ProgressHomeRow();
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      homeController.toItem(homeController.itemModelAll[index]),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    homeController.itemModelAll[index].name,
                                    style: FontDef.w400S16Cb,
                                  ),
                                  Text(
                                    homeController
                                        .itemModelAll[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: FontDef.w400S13Cb,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.price_change_outlined,
                                              color: ColorManager.black,
                                              size: 15),
                                          label: Text(
                                              "السعر: ${homeController.itemModelAll[index].price.toInt().toString()}",
                                              style: FontDef.w400S13Cb),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(Icons.timer,
                                              color: ColorManager.black,
                                              size: 15),
                                          label: Text(
                                              changeDateToDay(
                                                homeController
                                                    .itemModelAll[index].date,
                                              ),
                                              style: FontDef.w400S13Cb),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton.icon(
                                          label: Text(
                                            homeController
                                                .itemModelAll[index].address,
                                            style: FontDef.w400S13Cb,
                                          ),
                                          icon: const Icon(Icons.location_on,
                                              color: ColorManager.black,
                                              size: 15),
                                          onPressed: () {},
                                        ),
                                        TextButton.icon(
                                          label: Text(
                                            homeController
                                                .itemModelAll[index].phone,
                                            style: FontDef.w400S13Cb,
                                          ),
                                          icon: const Icon(Icons.phone,
                                              color: ColorManager.black,
                                              size: 15),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () => imageDialog(
                                    context,
                                    itemController,
                                    homeController.itemModelAll[index].images!),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${Hostting.imageItem}/${homeController.itemModelAll[index].images![0]}",
                                  placeholder: (context, url) =>
                                      const ProgressHomeRow(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
