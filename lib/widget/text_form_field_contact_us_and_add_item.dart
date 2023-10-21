import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/contact_us/widget/border_def.dart';
import 'package:flutter/material.dart';

class TextFormFieldContactUsAndAddItem extends StatelessWidget {
  const TextFormFieldContactUsAndAddItem(
      {super.key,
      required this.keyboard,
      required this.controller,
      required this.label,
      this.validator,
      this.minLine});
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final int? minLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        validator: validator,
        decoration: borderDef(label),
        style: FontDef.w400S14Cg,
        maxLines: minLine ?? 1,
      ),
    );
  }
}
