import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/add_item/add_item_controller.dart';
import 'package:beezer_v2/screen/add_item/widget/appbar_add_item.dart';
import 'package:beezer_v2/screen/add_item/widget/image_viewer.dart';
import 'package:beezer_v2/screen/add_item/widget/row_add_and_delete_image.dart';
import 'package:beezer_v2/screen/contact_us/widget/button_send.dart';
import 'package:beezer_v2/screen/home/primer_screen.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:beezer_v2/widget/row_number_screen_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImageToItem extends StatelessWidget {
  const AddImageToItem({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemController addItemController = Get.find();
    return Scaffold(
      appBar: appBarAddItem(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RowNumberScreenRegister(isScreenOne: false),
              const ImageViwer(),
              const RowAddAndDeleteImage(),
              const SizedBox(height: 40),
              ButtonSend(
                press: () async {
                  if (addItemController.imageFile.isEmpty) {
                    Get.snackbar("خطأ", "الرجاء رفع صورة على الاقل",
                        backgroundColor: ColorManager.primaryColor,
                        colorText: ColorManager.white);
                  } else {
                    progressDef();
                    var b = await addItemController.addItem();
                    if (b) {
                      Get.snackbar("معلومات", "تم اضافة الاعلان بنجاح ",
                          backgroundColor: ColorManager.primaryColor,
                          colorText: ColorManager.white);
                      Get.off(const PrimerScreen());
                    }
                  }
                },
                hint: "إضافة",
              )
            ],
          ),
        ),
      ),
    );
  }
}
