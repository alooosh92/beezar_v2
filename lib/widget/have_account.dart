import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
    required this.press,
    required this.text,
    required this.textPress,
  });
  final String text;
  final String textPress;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: FontDef.w700S13Cb),
        TextButton(
            onPressed: press,
            child: Text(
              textPress,
              style: FontDef.w700S13Cp,
            ))
      ],
    );
  }
}
