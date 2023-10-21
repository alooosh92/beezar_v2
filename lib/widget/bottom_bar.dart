import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/widget/icon_buttom_bar_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarDef extends StatelessWidget {
  const BottomNavigationBarDef({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetX<HomeController>(
      init: homeController,
      builder: (controller) {
        return Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtomBarDef(
                      icon: Icons.home_outlined,
                      order: 0,
                      check: controller.pageNumber.value,
                      press: () => controller.cheangePage(0),
                    ),
                    IconButtomBarDef(
                      icon: Icons.shopping_bag_outlined,
                      order: 1,
                      check: controller.pageNumber.value,
                      press: () => controller.cheangePage(1),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtomBarDef(
                      icon: Icons.favorite_border,
                      order: 2,
                      check: controller.pageNumber.value,
                      press: () => controller.cheangePage(2),
                    ),
                    IconButtomBarDef(
                      icon: Icons.person_outline_outlined,
                      order: 3,
                      check: controller.pageNumber.value,
                      press: () => controller.cheangePage(3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
