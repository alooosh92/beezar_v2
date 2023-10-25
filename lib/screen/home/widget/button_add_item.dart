import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/add_item/add_item_screen.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ButtonAddItem extends StatelessWidget {
  const ButtonAddItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.transparent,
      onPressed: () {
        var storeg = GetStorage();
        var token = storeg.read("token");
        if (token == null) {
          loginAlert();
        } else {
          Get.to(const AddItemScreen());
        }
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: ColorManager.white,
          size: 30,
        ),
      ),
    );
  }
}
