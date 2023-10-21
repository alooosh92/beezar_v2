// ignore_for_file: invalid_use_of_protected_member
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSubCategories extends StatelessWidget {
  const ListSubCategories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: 50,
      child: GetX(
          init: homeController,
          builder: (controller) {
            String cat = controller.listGategoryModel
                .where((element) => element.id == controller.categore.value)
                .first
                .name;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.listSubCategory[cat]!.length,
              itemBuilder: (context, index) {
                bool cho = false;
                if (controller.listSubCategory[cat]![index].id ==
                    controller.subCategory.value) {
                  cho = true;
                } else {
                  cho = false;
                }
                return InkWell(
                  onTap: () => controller.cheangeSubCategory(
                      controller.listSubCategory[cat]![index].id),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Text(
                          controller.listSubCategory[cat]![index].name,
                          style: !cho ? FontDef.w400S16Cg : FontDef.w400S16Cb,
                        ),
                        Visibility(
                          visible: cho,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
