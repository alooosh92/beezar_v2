import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/widget/change_date_to_day.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowItemHome extends StatelessWidget {
  const RowItemHome(
      {super.key,
      required this.sizeH,
      required this.sizeW,
      required this.future});
  final double sizeH;
  final double sizeW;
  final Future<List<ItemModel>>? future;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return FutureBuilder<List<ItemModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: sizeH,
              width: sizeW,
              child: const ProgressHomeRow(),
            );
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return SizedBox(
              height: sizeH,
              width: sizeW,
              child: const Center(
                child: Text("لا يوجد عناصر لعرضها", style: FontDef.w400S14Cg),
              ),
            );
          }
          return SizedBox(
            height: sizeH,
            child: ListView.builder(
              itemCount:
                  snapshot.data!.length > 25 ? 25 : snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => homeController.toItem(snapshot.data![index]),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10, top: 5, bottom: 5, right: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: ColorManager.litePrimaryColor,
                          offset: Offset(1, 2),
                          blurStyle: BlurStyle.normal,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Banner(
                          location: BannerLocation.topEnd,
                          // color: ColorManager.primaryColor,
                          message: homeController.listGategoryModel.any(
                                  (element) =>
                                      element.id ==
                                          snapshot.data![index].categoryId &&
                                      element.name == "الوطائف الشاغرة")
                              ? "الراتب: ${snapshot.data![index].price.toInt().toString()}"
                              : "السعر: ${snapshot.data![index].price.toInt().toString()}",
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Hostting.imageItem}/${snapshot.data![index].images![0]}",
                            placeholder: (context, url) =>
                                const ProgressHomeRow(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: sizeH - 70,
                            width: sizeW - 30,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          snapshot.data![index].name,
                          style: FontDef.w700S12Cb,
                        ),
                        SizedBox(
                          width: sizeW - 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                  ),
                                  Text(
                                    snapshot.data![index].address,
                                    style: FontDef.w500S11Cb,
                                  ),
                                ],
                              ),
                              Text(
                                changeDateToDay(snapshot.data![index].date),
                                style: FontDef.w500S11Cb,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
