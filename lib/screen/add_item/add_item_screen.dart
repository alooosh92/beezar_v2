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
  const AddItemScreen({super.key, this.item});
  final AddItem? item;
  @override
  Widget build(BuildContext context) {
    AddItemController addItemController = Get.find();
    final formKey = GlobalKey<FormState>();

    TextEditingController name =
        TextEditingController(text: item == null ? null : item!.name);
    TextEditingController description =
        TextEditingController(text: item == null ? null : item!.des);
    TextEditingController price = TextEditingController(
        text: item == null ? null : item!.price.toString());
    int? category = item == null ? null : item!.catId;
    if (item != null) {
      addItemController.changecategory(item!.catId!);
    }
    int? sub = item == null ? null : item!.subCatID;
    String? region = item == null ? null : item!.address;
    return Scaffold(
      appBar: appBarAddItem(item == null),
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
                        // ignore: prefer_null_aware_operators
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
                    label: "عنوان الإعلان ",
                    validator: (value) => ValidatorDef.validatorName(value),
                  ),
                  TextFormFieldContactUsAndAddItem(
                    keyboard: TextInputType.number,
                    controller: price,
                    label: addItemController.price.value,
                    validator: (value) => ValidatorDef.validatorPrice(value),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: item == null,
                    child: DropdownButtonFormField<String?>(
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
                        AddItem itemNew = AddItem(
                          // ignore: prefer_null_aware_operators
                          id: item == null ? null : item!.id,
                          catId: category,
                          des: description.text,
                          name: name.text,
                          price: double.tryParse(price.text),
                          subCatID: sub,
                          address: region,
                        );
                        addItemController.item = itemNew;
                        Get.to(AddImageToItem(
                          // ignore: prefer_null_aware_operators
                          imgs: item == null ? null : item!.iamgeUri,
                        ));
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
