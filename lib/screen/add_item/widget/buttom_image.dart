import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    super.key,
    required this.icon,
    required this.press,
    required this.color,
    this.size,
  });
  final void Function() press;
  final IconData icon;
  final Color color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Center(
        child: Container(
          height: size ?? 50,
          width: size ?? 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            icon,
            color: ColorManager.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
