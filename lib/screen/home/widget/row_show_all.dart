import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class RowShowAll extends StatelessWidget {
  const RowShowAll({
    super.key,
    required this.press,
    required this.text,
  });
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: FontDef.w500S15Cb,
        ),
        // TextButton(
        //   onPressed: press,
        //   child: const Text(
        //     "شاهد الكل",
        //     style: FontDef.w500S12Cp,
        //   ),
        // ),
      ],
    );
  }
}
