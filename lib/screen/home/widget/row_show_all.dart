import 'package:beezar_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class RowShowAll extends StatelessWidget {
  const RowShowAll({
    super.key,
    required this.press,
    required this.text,
    this.showMore,
  });
  final String text;
  final void Function() press;
  final bool? showMore;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: FontDef.w500S15Cb,
        ),
        Visibility(
          visible: showMore ?? false,
          child: TextButton(
            onPressed: press,
            child: const Text(
              "شاهد المزيد",
              style: FontDef.w500S12Cp,
            ),
          ),
        ),
      ],
    );
  }
}
