import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class IconButtomBarDef extends StatelessWidget {
  const IconButtomBarDef({
    super.key,
    required this.check,
    required this.icon,
    required this.order,
    required this.press,
  });
  final void Function() press;
  final IconData icon;
  final int order;
  final int check;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: order == check ? ColorManager.litePrimaryColor : null),
        child: Icon(icon,
            color: order == check
                ? ColorManager.darkPrimaryColor
                : ColorManager.darkGrayIcon,
            size: 30),
      ),
    );
  }
}
