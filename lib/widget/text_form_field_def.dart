import 'package:beezer_v2/widget/input_decration_def.dart';
import 'package:flutter/material.dart';

class TextFormFieldDeF extends StatelessWidget {
  const TextFormFieldDeF({
    super.key,
    required this.label,
    required this.controller,
    required this.paddingTop,
    this.icon,
    this.validator,
    this.keyboard,
  });
  final String label;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double paddingTop;
  final TextInputType? keyboard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        validator: validator,
        decoration: inputDecorationDef(icon, label),
      ),
    );
  }
}
