import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

InputDecoration borderDef(String? label) {
  return InputDecoration(
    isDense: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorManager.primaryColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorManager.primaryColor)),
    label: Text(label ?? ""),
  );
}
