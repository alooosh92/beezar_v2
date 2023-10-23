import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldCommit extends StatelessWidget {
  const TextFieldCommit({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    TextEditingController com = TextEditingController();
    ItemController itemController = Get.find();
    return TextFormField(
      controller: com,
      style: FontDef.w500S11Cb,
      decoration: InputDecoration(
        hintText: "اكتب تعليق",
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () async {
            var b = await itemController.writeComment(id, com.text);
            if (!b) {
              Get.snackbar("خطأ", "حدث خطأ ما الرجاء التواصل مع المسؤول");
            }
            com.text = "";
          },
          icon: const Icon(Icons.send_outlined),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
