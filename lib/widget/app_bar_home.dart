// ignore_for_file: invalid_use_of_protected_member

import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:beezer_v2/widget/drop_down_buttom_def.dart';
import 'package:beezer_v2/widget/input_decration_def.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarHome(BuildContext context) {
  HomeController homeController = Get.find();
  return AppBar(
    toolbarHeight: 75,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    leading: Image.asset("lib/assets/images/logoo 1.png"),
    title: Column(
      children: [
        SizedBox(
          height: 25,
          width: MediaQuery.sizeOf(context).width * 0.65,
          child: GetX<HomeController>(
            init: homeController,
            builder: (controller) {
              return DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  searchFieldProps: TextFieldProps(
                      style: FontDef.w400S13Cb,
                      padding: const EdgeInsets.all(10),
                      decoration: inputDecorationDef(Icons.search, "بحث")),
                  showSearchBox: true,
                ),
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide:
                            BorderSide(color: ColorManager.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide:
                            BorderSide(color: ColorManager.primaryColor)),
                    hintText: "بحث",
                    hintStyle: FontDef.w700S13Cp,
                    isDense: true,
                    prefixIcon:
                        Icon(Icons.search, color: ColorManager.primaryColor),
                  ),
                ),
                items: homeController.listDropDownSearch.value,
                onChanged: (value) {
                  int id =
                      int.parse(value!.substring(0, value.indexOf("-") - 1));
                  var item = homeController.itemModelAll.value
                      .where((element) => element.id == id)
                      .first;
                  Get.to(ItemScreen(item: item));
                },
              );
            },
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Stack(
          children: [
            Icon(Icons.notifications_none_outlined,
                color: ColorManager.grayText),
            Icon(
              Icons.brightness_1,
              color: ColorManager.red,
              size: 8,
            )
          ],
        ),
      ),
    ],
    bottom: const PreferredSize(
      preferredSize: Size(200, 25),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.location_on_outlined),
            DropdownButtonHideUnderline(
              child: DropDownButtonDef(),
            )
          ],
        ),
      ),
    ),
  );
}
