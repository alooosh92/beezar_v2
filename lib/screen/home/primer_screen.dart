import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/page/home_screen.dart';
import 'package:beezer_v2/screen/home/page/my_favorite_screen.dart';
import 'package:beezer_v2/screen/home/page/my_item_screen.dart';
import 'package:beezer_v2/screen/home/page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimerScreen extends StatelessWidget {
  const PrimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: page.length,
      controller: homeController.pageController,
      itemBuilder: (context, index) {
        return page[index];
      },
    );
  }
}

List<Widget> page = [
  const HomeScreen(),
  const MyItemScreen(),
  const MyFavoriteScreen(),
  const ProfileScreen(),
];
