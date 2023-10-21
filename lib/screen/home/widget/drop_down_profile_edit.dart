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
        dropDownMenuItemDef("دمشق", "دمشق"),
        dropDownMenuItemDef("حلب", "حلب"),
        dropDownMenuItemDef("حمص", "حمص"),
        dropDownMenuItemDef("ادلب", "ادلب"),
        dropDownMenuItemDef("اللازقبة", "اللازقبة"),
        dropDownMenuItemDef("طرطوس", "طرطوس"),
        dropDownMenuItemDef("القامشلي", "القامشلي"),
        dropDownMenuItemDef("دير الزور", "دير الزور"),
        dropDownMenuItemDef("الحسكة", "الحسكة"),
        dropDownMenuItemDef("الرقة", "الرقة"),
        dropDownMenuItemDef("تدمر", "تدمر"),
        dropDownMenuItemDef("حماه", "حماه"),
        dropDownMenuItemDef("الطبقة", "الطبقة"),
        dropDownMenuItemDef("بو كمال", "بو كمال"),
        dropDownMenuItemDef("منبج", "منبج"),
        dropDownMenuItemDef("جرابلس", "جرابلس"),
        dropDownMenuItemDef("ريف دمشق", "ريف دمشق"),
        dropDownMenuItemDef("قنيطرة", "قنيطرة"),
        dropDownMenuItemDef("درعا", "درعا"),
      ],
      onChanged: (value) => setState(() {
        widget.press;
      }),
    );
  }
}
