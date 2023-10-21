import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/contact_us/widget/border_def.dart';
import 'package:beezer_v2/screen/contact_us/widget/button_send.dart';
import 'package:beezer_v2/screen/contact_us/widget/list_drop_dawn_subject.dart';
import 'package:beezer_v2/screen/contact_us/widget/row_icon.dart';
import 'package:beezer_v2/widget/text_form_field_contact_us_and_add_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController massege = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorManager.black,
            )),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/images/tr-logo.png",
                  height: 150,
                  width: 150,
                ),
                const Text(
                  "تواصل معنا",
                  style: FontDef.w700S24Cb,
                ),
                DropdownButtonFormField<String?>(
                  decoration: borderDef(""),
                  items: listDropDawnSupject,
                  onChanged: (value) {},
                  hint: const Text("إختر الموضوع"),
                  style: FontDef.w400S14Cg,
                ),
                TextFormFieldContactUsAndAddItem(
                  controller: name,
                  keyboard: TextInputType.text,
                  label: "الاسم",
                ),
                TextFormFieldContactUsAndAddItem(
                  controller: email,
                  keyboard: TextInputType.emailAddress,
                  label: "البريد الالكتروني",
                ),
                TextFormFieldContactUsAndAddItem(
                  controller: massege,
                  keyboard: TextInputType.text,
                  label: "نص الرسالة",
                  minLine: 4,
                ),
                ButtonSend(press: () {}, hint: "ارسال"),
                const RowIcon()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
