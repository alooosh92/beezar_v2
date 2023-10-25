import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/list_sub_categories.dart';
import 'package:beezer_v2/screen/home/widget/list_view_sub_categories_item.dart';
import 'package:beezer_v2/screen/home/widget/row_item_home.dart';
import 'package:beezer_v2/screen/home/widget/row_show_all.dart';
import 'package:beezer_v2/screen/show_all_item/show_all_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemShow extends StatelessWidget {
  const ItemShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetX<HomeController>(
      init: homeController,
      builder: (controller) {
        if (controller.categore.value == -1) {
          return Column(
            children: [
              RowShowAll(
                  press: () => Get.to(const ShowAllItem()),
                  text: "المضافة حديثاً",
                  showMore: true),
              RowItemHome(
                  future: homeController.getAllItems(false),
                  sizeH: 210,
                  sizeW: 150),
              RowShowAll(press: () {}, text: "المفضلة"),
              RowItemHome(
                  future: homeController.getFavourite(null),
                  sizeH: 165,
                  sizeW: 145),
            ],
          );
        } else {
          return const Column(
            children: [
              ListSubCategories(),
              ListViewSubCategoriesItems(),
            ],
          );
        }
      },
    );
  }
}
