import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class PolicyBtn extends StatelessWidget {
  const PolicyBtn({
    super.key,
    required this.press,
    required this.text,
    this.padding,
  });
  final String text;
  final void Function() press;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding ?? 0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            backgroundColor: ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          child: Text(
            text,
            style: FontDef.w700S16Cw,
          ),
        ),
      ),
    );
  }
}
