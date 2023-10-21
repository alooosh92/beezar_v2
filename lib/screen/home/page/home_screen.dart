import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/button_add_item.dart';
import 'package:beezer_v2/screen/home/widget/item_show.dart';
import 'package:beezer_v2/screen/home/widget/row_item_categories.dart';
import 'package:beezer_v2/screen/home/widget/row_show_all.dart';
import 'package:beezer_v2/widget/app_bar_home.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      floatingActionButton: const ButtonAddItem(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBarHome(context),
      bottomNavigationBar: const BottomNavigationBarDef(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: RefreshIndicator(
          onRefresh: () async {
            homeController.getAllItems(true);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RowShowAll(press: () {}, text: "الأقسام"),
                const RowItemCategories(),
                const ItemShow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
