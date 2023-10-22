import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/widget/drop_down_item_def.dart';
import 'package:flutter/material.dart';

class DropDownProfileEdit extends StatefulWidget {
  const DropDownProfileEdit({
    super.key,
    required this.press,
    required this.val,
  });
  final void Function(String?) press;
  final String? val;
  @override
  State<DropDownProfileEdit> createState() => _DropDownProfileEditState();
}

class _DropDownProfileEditState extends State<DropDownProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: FontDef.w400S15Cb,
      value: widget.val,
      items: [
        dropDownMenuItemDef("", "حدد الموقع"),
        dropDownMenuItemDef("الرقة", "الرقة"),
        dropDownMenuItemDef("الطبقة", "الطبقة"),
        dropDownMenuItemDef("الجرنية", "الجرنية"),
        dropDownMenuItemDef("منبج", "منبج"),
        dropDownMenuItemDef("جرابلس", "جرابلس"),
        dropDownMenuItemDef("عين عيسى", "عين عيسى"),
        dropDownMenuItemDef("عزاز", "عزاز"),
        dropDownMenuItemDef("عفرين", "عفرين"),
        dropDownMenuItemDef("ادلب", "ادلب"),
        dropDownMenuItemDef("الباب", "الباب"),
        dropDownMenuItemDef("الدانا", "الدانا"),
        dropDownMenuItemDef("سرمدا", "سرمدا"),
        dropDownMenuItemDef("مارع", "مارع"),
        dropDownMenuItemDef("ادلب", "ادلب"),
        dropDownMenuItemDef("جنديرس", "جنديرس"),
        dropDownMenuItemDef("حارم", "حارم"),
        dropDownMenuItemDef("القامشلي", "القامشلي"),
        dropDownMenuItemDef("عامودا", "عامودا"),
        dropDownMenuItemDef("معبدة", "معبدة"),
        dropDownMenuItemDef("الحسكة", "الحسكة"),
        dropDownMenuItemDef("هجين", "هجين"),
        dropDownMenuItemDef("بو كمال", "بو كمال"),
        dropDownMenuItemDef("الميادين", "الميادين"),
        dropDownMenuItemDef("دير الزور", "دير الزور"),
        dropDownMenuItemDef("حلب", "حلب"),
        dropDownMenuItemDef("ريف حلب", "ريف حلب"),
        dropDownMenuItemDef("حمص", "حمص"),
        dropDownMenuItemDef("دمشق", "دمشق"),
        dropDownMenuItemDef("ريف دمشق", "ريف دمشق"),
        dropDownMenuItemDef("حماه", "حماه"),
        dropDownMenuItemDef("تدمر", "تدمر"),
        dropDownMenuItemDef("اللازقبة", "اللازقبة"),
        dropDownMenuItemDef("طرطوس", "طرطوس"),
        dropDownMenuItemDef("قنيطرة", "قنيطرة"),
        dropDownMenuItemDef("درعا", "درعا"),
      ],
      onChanged: (value) => setState(() {
        widget.press;
      }),
    );
  }
}
