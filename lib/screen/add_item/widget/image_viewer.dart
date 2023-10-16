import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/color_manager.dart';
import '../add_item_controller.dart';
import 'buttom_image.dart';

class ImageViwer extends StatelessWidget {
  const ImageViwer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.7);
    AddItemController addItemController = Get.find();
    return GetX<AddItemController>(
      init: addItemController,
      builder: (controller) => Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.darkGrayIcon, width: 1)),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: addItemController.imageFile.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    addItemController.imageFile[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Visibility(
              visible: addItemController.imageFile.isEmpty,
              child: ButtonImage(
                color: ColorManager.primaryColor,
                icon: Icons.upload,
                press: () => addItemController.addImage(),
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
