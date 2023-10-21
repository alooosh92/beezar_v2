import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/widget/buttin_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> conttactWithUser(String phone) {
  return Get.dialog(
    AlertDialog(
      backgroundColor: ColorManager.litePrimaryColor,
      elevation: 3,
      insetPadding: const EdgeInsets.all(30),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "طرق التواصل",
            style: FontDef.w700S24Cw,
          ),
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.close,
                color: ColorManager.white,
              ))
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonContact(
            phone: phone,
            svg: "lib/assets/images/telephone-call.svg",
            text: "اتصال هاتفي",
            press: () async {
              if (await canLaunchUrl(Uri.parse("tel:$phone"))) {
                launchUrl(Uri.parse("tel:$phone"));
              }
            },
          ),
          ButtonContact(
            phone: phone,
            svg: "lib/assets/images/whatsapp.svg",
            text: "وتس اب",
            press: () async {
              if (await canLaunchUrl(
                  Uri.parse("whatsapp://send?phone=$phone"))) {
                launchUrl(Uri.parse("whatsapp://send?phone=$phone"));
              } else {
                launchUrl(Uri.parse("https://wa.me/$phone"));
              }
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ColorManager.white)),
          child: const Text(
            "الغاء",
            style: FontDef.w600S17Cb,
          ),
        )
      ],
    ),
  );
}
