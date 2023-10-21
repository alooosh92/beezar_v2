import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/add_item/add_item_controller.dart';
import 'package:beezer_v2/screen/add_item/widget/buttom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowAddAndDeleteImage extends StatelessWidget {
  const RowAddAndDeleteImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddItemController addItemController = Get.find();
    return GetX<AddItemController>(
      init: addItemController,
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Visibility(
          visible: addItemController.imageFile.isNotEmpty,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonImage(
                color: ColorManager.primaryColor,
                icon: Icons.upload,
                press: () => addItemController.addImage(),
              ),
              ButtonImage(
                color: ColorManager.red,
                icon: Icons.delete,
                press: () => addItemController.deleteImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
