import 'package:beezer_v2/model/add_item.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/add_item/add_image_to_item.dart';
import 'package:beezer_v2/screen/add_item/add_item_controller.dart';
import 'package:beezer_v2/screen/add_item/widget/appbar_add_item.dart';
import 'package:beezer_v2/screen/contact_us/widget/border_def.dart';
import 'package:beezer_v2/screen/contact_us/widget/button_send.dart';
import 'package:beezer_v2/widget/list_region.dart';
import 'package:beezer_v2/widget/row_number_screen_register.dart';
import 'package:beezer_v2/widget/text_form_field_contact_us_and_add_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemController addItemController = Get.find();
    final formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController price = TextEditingController();
    int? category;
    // ignore: unused_local_variable
    int? sub;
    String? region;
    return Scaffold(
      appBar: appBarAddItem(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: GetX<AddItemController>(
            init: AddItemController(),
            builder: (controller) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RowNumberScreenRegister(isScreenOne: true),
                  DropdownButtonFormField<int?>(
                    value: category,
                    decoration: borderDef(""),
                    items: addItemController.cat,
                    onChanged: (value) {
                      sub = null;
                      category = value;
                      addItemController.changecategory(value!);
                    },
                    hint: const Text("إختر التصنيف"),
                    style: FontDef.w400S14Cg,
                    validator: (value) => ValidatorDef.validatorGategory(value),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<int?>(
                    value: addItemController.choCat.value != -1
                        ? addItemController
                                    .sub[addItemController.choCat.value] !=
                                null
                            ? addItemController
                                .sub[addItemController.choCat.value]!
                                .first
                                .value
                            : null
                        : null,
                    decoration: borderDef(""),
                    items:
                        addItemController.sub[addItemController.choCat.value],
                    onChanged: (value) => sub = value,
                    hint: const Text("إختر التصنيف الفرعي"),
                    style: FontDef.w400S14Cg,
                    validator: (value) =>
                        ValidatorDef.validatorSubGategory(value),
                  ),
                  TextFormFieldContactUsAndAddItem(
                    keyboard: TextInputType.text,
                    controller: name,
                    label: "اسم المادة",
                    validator: (value) => ValidatorDef.validatorName(value),
                  ),
                  TextFormFieldContactUsAndAddItem(
                    keyboard: TextInputType.text,
                    controller: price,
                    label: "السعر",
                    validator: (value) => ValidatorDef.validatorPrice(value),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String?>(
                    value: region,
                    decoration: borderDef(""),
                    items: listRegion,
                    onChanged: (value) {
                      region = value;
                    },
                    hint: const Text("إختر المحافظة"),
                    style: FontDef.w400S14Cg,
                    validator: (value) => ValidatorDef.validatorRegion(value),
                  ),
                  TextFormFieldContactUsAndAddItem(
                    keyboard: TextInputType.text,
                    controller: description,
                    label: "وصف المادة",
                    minLine: 4,
                    validator: (value) =>
                        ValidatorDef.validatordiscreption(value),
                  ),
                  const SizedBox(height: 40),
                  ButtonSend(
                    press: () {
                      if (formKey.currentState!.validate()) {
                        AddItem item = AddItem(
                          catId: category,
                          des: description.text,
                          name: name.text,
                          price: double.tryParse(price.text),
                          subCatID: sub,
                          address: region,
                        );
                        addItemController.item = item;
                        Get.to(const AddImageToItem());
                      }
                    },
                    hint: "التالي",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
