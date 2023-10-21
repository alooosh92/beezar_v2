import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecorationProgfileEdit(IconData? icon, String label) {
  return InputDecoration(
    contentPadding:
        const EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 15),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.grayText, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.grayText, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.grayText, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    label: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(label),
    ),
  );
}
