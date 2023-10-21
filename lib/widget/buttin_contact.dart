import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonContact extends StatelessWidget {
  const ButtonContact(
      {super.key,
      required this.phone,
      required this.svg,
      required this.text,
      required this.press});
  final String phone;
  final String svg;
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svg,
              height: 50,
              width: 50,
            ),
            const Text(
              "اتصال هاتفي",
              style: FontDef.w700S16Cw,
            ),
          ],
        ),
      ),
    );
  }
}
