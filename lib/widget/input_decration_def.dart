import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecorationDef(IconData? icon, String label) {
  return InputDecoration(
    contentPadding:
        const EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 15),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.primaryColor, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(35),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.primaryColor, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(35),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.primaryColor, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(35),
      ),
    ),
    suffixIcon:
        icon != null ? Icon(icon, color: ColorManager.darkGrayText) : null,
    label: Text(
      label,
      style: FontDef.w400S14Cg,
    ),
  );
}
