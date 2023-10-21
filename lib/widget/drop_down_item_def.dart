import 'package:flutter/material.dart';

DropdownMenuItem<String?> dropDownMenuItemDef(dynamic val, String text) {
  return DropdownMenuItem<String?>(
    value: val,
    child: Text(text),
  );
}
