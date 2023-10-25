import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/page/home_screen.dart';
import 'package:beezer_v2/screen/home/page/my_favorite_screen.dart';
import 'package:beezer_v2/screen/home/page/my_item_screen.dart';
import 'package:beezer_v2/screen/home/page/profile_screen.dart';
import 'package:beezer_v2/widget/icon_buttom_bar_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
                        press: () {
                          homeController.pageNumber.value = 0;
                          homeController.getAllItems(true);
                          Get.to(const HomeScreen());
                        }),
                    IconButtomBarDef(
                        icon: Icons.shopping_bag_outlined,
                        order: 1,
                        check: controller.pageNumber.value,
                        press: () {
                          var storeg = GetStorage();
                          var token = storeg.read("token");
                          if (token == null) {
                            loginAlert();
                          } else {
                            homeController.pageNumber.value = 1;
                            Get.to(const MyItemScreen());
                          }
                        }),
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
                      press: () {
                        var storeg = GetStorage();
                        var token = storeg.read("token");
                        if (token == null) {
                          loginAlert();
                        } else {
                          homeController.pageNumber.value = 2;
                          Get.to(const MyFavoriteScreen());
                        }
                      },
                    ),
                    IconButtomBarDef(
                      icon: Icons.person_outline_outlined,
                      order: 3,
                      check: controller.pageNumber.value,
                      press: () {
                        var storeg = GetStorage();
                        var token = storeg.read("token");
                        if (token == null) {
                          loginAlert();
                        } else {
                          homeController.pageNumber.value = 3;
                          Get.to(const ProfileScreen());
                        }
                      },
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

Future<dynamic> loginAlert() {
  return Get.dialog(
    AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Get.offAll(const LoginScreen());
          },
          child: Text(
            "تسجيل دخول",
            style: FontDef.w700S13Cp,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "إلغاء",
            style: FontDef.w700S13Cb,
          ),
        ),
      ],
      content: Text(
        "لا يمكن تنفيذ هذا الطلب بدون تسجيل دخول",
        style: FontDef.w400S15Cb,
      ),
      title: Text(
        "تحذير",
        style: FontDef.w400S13Cb,
      ),
    ),
  );
}
