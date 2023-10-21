import 'package:beezer_v2/screen/home/widget/input_decoration_profile_edit.dart';
import 'package:flutter/material.dart';

class TextFormFieldProfileEdit extends StatelessWidget {
  const TextFormFieldProfileEdit({
    super.key,
    required this.label,
    required this.controller,
    required this.paddingTop,
    this.icon,
    this.validator,
    required this.keyboard,
    required this.press,
  });
  final String label;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double paddingTop;
  final TextInputType keyboard;
  final void Function(String?) press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        validator: validator,
        decoration: inputDecorationProgfileEdit(icon, label),
        onChanged: press,
      ),
    );
  }
}
