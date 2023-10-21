// ignore_for_file: invalid_use_of_protected_member

import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/app_bar_fav.dart';
import 'package:beezer_v2/screen/home/widget/button_add_item.dart';
import 'package:beezer_v2/screen/home/widget/show_list_item_widget.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    var list = homeController.itemModelAll.value
        .where((element) => element.favorite)
        .toList();
    return Scaffold(
      floatingActionButton: const ButtonAddItem(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBarFav(context, "المفضلة"),
      bottomNavigationBar: const BottomNavigationBarDef(),
      body: SizedBox(
        height: double.infinity,
        child: ShowListItemWidget(isFavorite: true, list: list),
      ),
    );
  }
}
