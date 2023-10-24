import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowItemCategories extends StatefulWidget {
  const RowItemCategories({
    super.key,
  });

  @override
  State<RowItemCategories> createState() => _RowItemCategoriesState();
}

class _RowItemCategoriesState extends State<RowItemCategories> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetX<HomeController>(
        init: homeController,
        builder: (controller) {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: controller.listGategoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.cheangeCategory(
                        controller.listGategoryModel[index].id);
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10, top: 5, bottom: 5, right: 5),
                    padding: const EdgeInsets.all(5),
                    height: 100,
                    width: 85,
                    decoration: BoxDecoration(
                      color: homeController.categore.value != -1 &&
                              homeController.listGategoryModel[index].id !=
                                  homeController.categore.value
                          ? Colors.transparent
                          : ColorManager.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: homeController.categore.value != -1 &&
                              homeController.listGategoryModel[index].id !=
                                  homeController.categore.value
                          ? const []
                          : const [
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
                        // CachedNetworkImage(
                        //   imageUrl:
                        //       '${Hostting.imageCategory}/${homeController.listGategoryModel[index].image}',
                        //   placeholder: (context, url) =>
                        //       const ProgressHomeRow(),
                        //   errorWidget: (context, url, error) =>
                        //       const Icon(Icons.error),
                        //   height: 50,
                        //   width: 50,
                        // ),
                        Text(
                          homeController.listGategoryModel[index].name,
                          style: FontDef.w600S9Cb,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
    //});
  }
}
