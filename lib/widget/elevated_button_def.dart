import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class ElevatedButtonDef extends StatelessWidget {
  const ElevatedButtonDef({
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
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: ColorManager.primaryColor,
          maximumSize: Size(MediaQuery.sizeOf(context).width, 50),
          minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: Text(
          text,
          style: FontDef.w700S16Cw,
        ),
      ),
    );
  }
}
